# Copyright (c) 2007-2025 Andy Maleh
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'set'
require 'glimmer/data_binding/observable'
require 'glimmer/data_binding/observer'
require 'array_include_methods'

using ArrayIncludeMethods

module Glimmer
  module DataBinding
    module ObservableArray
      include Observable
      
      class Notifier
        include Observer
        
        attr_reader :observable_array
        
        def initialize(observable_array)
          @observable_array = observable_array
        end
        
        def call(new_value=nil, *extra_args)
          @observable_array.notify_observers
        end
      end

      def add_observer(observer, *args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        element_properties = args.flatten.compact.uniq
        return observer if has_observer?(observer) && has_observer_element_properties?(observer, element_properties)
        property_observer_list[observer] = options
        observer_element_properties[observer] = Concurrent::Set.new(Concurrent::Array.new(element_properties_for(observer).to_a) + Concurrent::Array.new(element_properties)) # converting to Array as a workaround to jruby-9.3.2.0 issue TODO remove this workaround when no longer needed
        if !options.empty? && options[:recursive].is_a?(Integer)
          options = options.clone
          options[:recursive] = options[:recursive] - 1
        end
        each { |element| add_element_observer(element, observer, options) }
        observer
      end
      
      def add_element_observers(element, general_options = {})
        property_observer_list.each do |observer, options|
          add_element_observer(element, observer, options.merge(general_options))
        end
      end

      def add_element_observer(element, observer, options = {})
        element_properties_for(observer).each do |property|
          observer.observe(element, property, options)
        end
        if element.is_a?(Array) && (options[:recursive] == true || (options[:recursive].is_a?(Integer) && options[:recursive] >= 0))
          ensure_array_object_observer(element, options)
        end
      end
      
      def ensure_array_object_observer(object, options)
        return unless object&.is_a?(Array)
        array_object_observer = array_object_observer_for(object)
        array_observer_registration = array_object_observer.observe(object, options)
        property_observer_list.each do |observer, options|
          my_registration = observer.registration_for(self)
          observer.add_dependent(my_registration => array_observer_registration)
        end
      end
      
      def array_object_observer_for(object)
        @array_object_observers ||= Concurrent::Hash.new
        @array_object_observers[object] = Notifier.new(self) unless @array_object_observers.has_key?(object)
        @array_object_observers[object]
      end

      def remove_observer(observer, *args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        element_properties = args
        element_properties = element_properties.flatten.compact.uniq
        if !element_properties.empty?
          old_element_properties = element_properties_for(observer)
          observer_element_properties[observer] = Concurrent::Set.new(Concurrent::Array.new(element_properties_for(observer).to_a) - Concurrent::Array.new(element_properties)) # TODO remove this workaround when no longer needed (it is for jruby-9.3.2.0 issue)
          each { |element| element_properties.each { |property| observer.unobserve(element, property) } }
        end
        if element_properties_for(observer).empty?
          property_observer_list.delete(observer)
          observer_element_properties.delete(observer)
          each { |element| remove_element_observer(element, observer) }
        end
        observer
      end

      def remove_element_observers(element)
        property_observer_list.each do |observer, options|
          remove_element_observer(element, observer)
        end
      end

      def remove_element_observer(element, observer)
        element_properties_for(observer).each do |property|
          observer.unobserve(element, property)
        end
        if element.is_a?(ObservableArray)
          array_object_observer_for(element).unobserve(element)
          element.property_observer_list.select {|obs, opt| obs.respond_to?(:observable_array) && obs.observable_array == self}.each do |o|
            o.deregister_all_observables if o.respond_to?(:deregister_all_observables)
            @array_object_observers.reject! {|k, v| v == o}
          end
        end
      end

      def has_observer?(observer)
        property_observer_list.keys.include?(observer)
      end
      
      def has_observer_element_properties?(observer, element_properties)
        element_properties_for(observer).to_a.include_all?(*element_properties)
      end

      def property_observer_list
        @property_observer_list ||= Concurrent::Hash.new
      end

      def observer_element_properties
        @observer_element_properties ||= Concurrent::Hash.new
      end

      def element_properties_for(observer)
        observer_element_properties[observer] ||= Concurrent::Set.new
      end

      def notify_observers
        property_observer_list.to_a.each { |obs, opt| obs.call(self) }
      end
      
      def <<(element)
        super(element).tap do
          add_element_observers(element)
          notify_observers
        end
      end
      alias push <<
      alias append <<
      
      def []=(index, value)
        old_value = self[index]
        unregister_dependent_observers(old_value)
        remove_element_observers(old_value)
        add_element_observers(value)
        super(index, value).tap do
          notify_observers
        end
      end
      
      def pop
        popped_element = last
        unregister_dependent_observers(popped_element)
        remove_element_observers(popped_element)
        super.tap do
          notify_observers
        end
      end
      
      def shift
        shifted_element = first
        unregister_dependent_observers(shifted_element)
        remove_element_observers(shifted_element)
        super.tap do
          notify_observers
        end
      end
      
      def delete(element)
        unregister_dependent_observers(element)
        remove_element_observers(element)
        super(element).tap do
          notify_observers
        end
      end
      
      def delete_at(index)
        old_value = self[index]
        unregister_dependent_observers(old_value)
        remove_element_observers(old_value)
        super(index).tap do
          notify_observers
        end
      end
      
      def delete_if(&block)
        if block_given?
          old_array = Array.new(self)
          super(&block).tap do |new_array|
            (old_array - new_array).each do |element|
              unregister_dependent_observers(element)
              remove_element_observers(element)
            end
            notify_observers
          end
        else
          super
        end
      end
      
      def clear
        each do |old_value|
          unregister_dependent_observers(old_value)
          remove_element_observers(old_value)
        end
        super.tap do
          notify_observers
        end
      end
      
      def reverse!
        super.tap do
          notify_observers
        end
      end

      def collect!(&block)
        if block_given?
          each do |old_value|
            unregister_dependent_observers(old_value)
            remove_element_observers(old_value)
          end
          super(&block).tap do
            each { |element| add_element_observers(element) }
            notify_observers
          end
        else
          super
        end
      end
      alias map! collect!

      def compact!
        # TODO consider checking which exact indices changed and only notifying if there is a change
        super.tap { notify_observers }
      end

      def flatten!(level=nil)
        each do |old_value|
          unregister_dependent_observers(old_value)
          remove_element_observers(old_value)
        end
        (level.nil? ? super() : super(level)).tap do
          each { |element| add_element_observers(element) }
          notify_observers
        end
      end

      def rotate!(count=1)
        super(count).tap { notify_observers }
      end

      def select!(&block)
        if block_given?
          old_array = Array.new(self)
          super(&block).tap do
            (old_array - self).each do |old_value|
              unregister_dependent_observers(old_value)
              remove_element_observers(old_value)
            end
            notify_observers
          end
        else
          super
        end
      end

      def filter!(&block)
        if block_given?
          old_array = Array.new(self)
          super(&block).tap do
            (old_array - self).each do |old_value|
              unregister_dependent_observers(old_value)
              remove_element_observers(old_value)
            end
            notify_observers
          end
        else
          super
        end
      end

      def shuffle!(hash = nil)
        (hash.nil? ? super() : super(random: hash[:random])).tap { notify_observers }
      end

      def slice!(arg1, arg2=nil)
        old_array = Array.new(self)
        (arg2.nil? ? super(arg1) : super(arg1, arg2)).tap do
          (old_array - self).each do |old_value|
            unregister_dependent_observers(old_value)
            remove_element_observers(old_value)
          end
          notify_observers
        end
      end

      def sort!(&block)
        (block.nil? ? super() : super(&block)).tap { notify_observers }
      end

      def sort_by!(&block)
        (block.nil? ? super() : super(&block)).tap { notify_observers }
      end

      def uniq!(&block)
        each do |old_value|
          unregister_dependent_observers(old_value)
          remove_element_observers(old_value)
        end
        (block.nil? ? super() : super(&block)).tap do
          each { |element| add_element_observers(element) }
          notify_observers
        end
      end

      def unshift(element)
        super(element).tap do
          add_element_observers(element)
          notify_observers
        end
      end
      alias prepend unshift

      def reject!(&block)
        if block.nil?
          super
        else
          old_array = Array.new(self)
          super(&block).tap do
            (old_array - self).each do |old_value|
              unregister_dependent_observers(old_value)
              remove_element_observers(old_value)
            end
            notify_observers
          end
        end
      end
      
      def replace(other_array)
        old_array = Array.new(self)
        super(other_array).tap do
          (old_array - self).each do |old_value|
            unregister_dependent_observers(old_value)
            remove_element_observers(old_value)
          end
          notify_observers
        end
      end
      
      def unregister_dependent_observers(old_value)
        return unless old_value.is_a?(ObservableModel) || old_value.is_a?(ObservableArray)
        property_observer_list.each { |observer, options| observer.unregister_dependents_with_observable(observer.registration_for(self), old_value) }
      end
      alias deregister_dependent_observers unregister_dependent_observers
    end
  end
end
