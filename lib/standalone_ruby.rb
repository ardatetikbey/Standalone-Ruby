require 'optparse'
require_relative 'utils/displayer'
require_relative 'utils/parameter_parser'
require_relative 'utils/ruby_copy'
require_relative 'utils/launcher_handler'
# require_relative 'utils/logger_helper'

class StandaloneRuby
  def initialize
    @parser = ParameterParser.new
    @parser.parse

    @params = @parser.params
    @displayer = Displayer.new(@params)
    @ruby_copy = RubyCopy.new(@params)
    @launcher_handler = LauncherHandler.new(@params)
  end

  def run
    Signal.trap("INT") do
      puts "\nProgram interrupted. Shutting down..."
      exit(0)
    end

    if @params[:version]
      puts "Standalone Ruby Gem Version 1.0"
      return
    end

    @displayer.banner
    @displayer.display_params

    @launcher_handler.handle
    @ruby_copy.robocopy_interpreter
  end
end
