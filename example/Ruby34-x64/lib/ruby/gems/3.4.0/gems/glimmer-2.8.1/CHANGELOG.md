# Change Log

Related Change Logs:
- [glimmer-dsl-swt/CHANGELOG.md](https://github.com/AndyObtiva/glimmer-dsl-swt/blob/master/CHANGELOG.md)

### 2.8.1

- Fix an issue in `ModelBinding#options_property_name` that was breaking Glimmer DSL for SWT on Linux

### 2.8.0

- Support ability to interpret multiple DSL expression hierarchies, by suspending interpretation of a hierarchy, interpreting another until done, and then resuming interpretation of previous hierarchy until done too. That is done by starting a new expression hierarchy interpretation using `Glimmer::DSL::Engine::new_parent_stack` in the middle of interpreting another expression hierarchy.
- Refactor/rename `Glimmer::DSL::Engine::parent_stacks` to `Glimmer::DSL::Engine::dsl_parent_stacks` and have it include an `Array` of `Array`s of parent stacks per DSL.

### 2.7.9

- Optimize performance of `Glimmer::DataBinding::ObservableModel#add_observer` by removing `OpenStruct` constant check.

### 2.7.8

- Allow passing `BindExpression` only 1 argument (e.g. presenter.todos) or 1 argument + 1 hash (e.g. presenter.todos, on_read: -> {})
- `ObserveExpression` always uses `ModelBinding` for arguments to leverage its advanced features, like nested/computed/indexed/keyed data-binding
- In Opal, `ModelBinding` converters/hooks do not require an argument anymore (e.g. can invoke `after_write: -> { do_something }` without block args)
- Fix issue whereby observing `model, :collection` was not firing on collection changes, but observing `model.collection` was firing on collection changes (now both fire on collection changes)

### 2.7.7

- Relax `array_include_methods` gem dependency to '>= 1.4.0', '< 1.6.0'

### 2.7.6

- Fix an issue in Opal by updating `Glimmer::DataBinding::Observer::Registration` to correctly inherit from `Struct` by assigning a `Struct.new` and opening a `do; end` block

### 2.7.5

- Improve error message when `Glimmer#method_missing` raises an error, including the problematic keyword to better help with troubleshooting

### 2.7.4

- Have `ObserveExpression` support passing an arbitrary number of arguments (not just the object and attribute) to support newer options from the Glimmer DSL like `recursive: true`

### 2.7.3

- Support case-insensitive static expressions

### 2.7.2

- Support capitalized static expressions

### 2.7.1

- Support upcased static expressions (in addition to default downcased ones)

### 2.7.0

- Support Hash keyed properties via `ModelBinding` (e.g. property as `some_hash_attribute[:some_key]`, `some_hash_attribute['some_key']`, `some_hash_attribute["some_key"]`)

### 2.6.0

- If a static expression cannot handle keyword, it is tried with available dynamic expressions instead of erroring out.

### 2.5.5

- Support observing an array object index directly (e.g. `ModelBinding.new(array, '[0]')` as opposed to `ModelBinding.new(self, 'array[0]')`)
- Extract Shine data-binding expression from Glimmer DSL for SWT to Glimmer as a reusable class: `Glimmer::DSL::ShineDataBindingExpression`
- Avoid compacting model with property in `ModelBinding` yet only compact property/args and keep model as is get a better error message in the case of a `nil` model
- Document data-binding options like on_read, after_read, etc...

### 2.5.4

- `Glimmer::DataBinding::ObservableModel` support for observing model attributes with specified `:attribute_writer_type` option (default: `:attribute=`), which can be a single symbol or an array (e.g. `attribute_writer_type: [:attribute=, :set_attribute]`). Glimmer automatches attribute name and automatically generates observer notification attribute writer methods.

### 2.5.3

- Provide `Observer#observe` option to tolerate not being able to extend an object for observation by silently not observing such object
- Use `Concurrent::Hash` for `ObservableModel#property_observer_hash`
- Use `Concurrent::Hash` for `ObservableHash#key_observer_hash`

### 2.5.1

- Fix issue with referencing `OpenStruct` without 'ostruct' library being required (it now checks if `OpenStruct` is loaded first and avoids referencing otherwise).

### 2.5.0

- Support observing `Struct`/`OpenStruct` changes via `:[]=` method in addition to attribute writers.
- Support read-only direct observation of `Hash` object without key via `ModelBinding` (e.g. `ModelBinding.new(some_hash)`)
- Support read-only direct observation of `Array` object without index via `ModelBinding` (e.g. `ModelBinding.new(some_array)`)
- Support observing `Hash` attribute with `ModelBinding` (all keys or a single key)
- Disable `#ensure_hash_object_observer` in ObservableModel/ObservableHash/ObservableArray since it has performance implications and is not necessary
- Fix issue with `#ensure_array_object_observer` not receiving `recursive: true` option when updating value of an attribute in `ObservableArray`, `ObservableModel`, and `ObservableHash`

### 2.4.1

- Support `recursive: [integer]` option for ObservableArray#add_observer for finite recursion

### 2.4.0

- Support passing arbitrary options to `Observer` `#observe` (`#register`) method (not just properties, like `recursive: true` for example)
- Make observing nested arrays within an array optional with `recursive: true` option
- Make `Observer` `dependents` collection rely on Concurrent::Hash when available
- Fix `Observer` cleanup of registrations and dependents on `#deregister` (was not cleaning up everything because observables were changing `#hash` value on content change and slipping through the cracks as a result)

### 2.3.0

- Have observing `ObservableArray` automatically notice if any values are nested arrays and observe them for micro-changes (recursively all the way down)

### 2.2.2

- Support auto-notifying on `ObservableArray#replace` observed changes
- Support auto-notifying on `ObservableArray#filter!` observed changes explicitly (even if `filter!` aliases `select!`)
- Support auto-notifying on `ObservableHash#filter!` observed changes explicitly (even if `filter!` aliases `select!`)

### 2.2.1

- Have `ObservableHash` call `notify_observers(key)` upon performing all mutation operations (as expected): `delete`, `delete_if`, `filter!`, `select!`, `keep_if`, `reject!`, `merge!`, `replace`, `shift`, `transform_keys!`, `transform_values!`
- Fix issue with `Glimmer::DataBinding::Observer.proc {|new_value| ...}.observe(array)` resulting in new_value coming across as `nil when the array is updated

### 2.2.0

- New `Glimmer::DataBinding::ObservableHash` support for observing `hash[key]=value` mutations
- Ensure observed ObservableHash values are enhanced with ObservableHash if they were of type Hash
- Ensure observed ObservableModel values are enhanced with ObservableHash if they were of type Hash

### 2.1.5

- Upgrade array_include_methods gem to version 1.4.0 (and fix minor version)
- Update API usage of `Array#include_all?` in `Glimmer::DataBinding::ObservableArray` to splat array (now required)

### 2.1.4

- Upgrade array_include_methods gem to version 1.2.0

### 2.1.3

- Upgrade array_include_methods gem to version 1.1.0

### 2.1.2

- Fix issue with irrelevent error message showing up for ENV['GLIMMER_LOGGER_LEVEL'] being empty (it is not a true error)

### 2.1.1

- Support double/triple/arbitrary dimension indexed arrays in ModelBinding property (e.g. `'grid[1][0]'` )

### 2.1.0

- Extracted ObserveExpression from Glimmer DSL for SWT

### 2.0.1

-  ObservableArray notify observers on shift

### 2.0.0

- Extract Glimmer::DSL::BindExpression from Glimmer DSL for SWT
- Make concurrent-ruby an optional dependency (automatically using its data-structure classes if present)

### 1.3.1

- Use `Concurrent::Array` instead of `Array` in `Glimmer::DataBinding::ModelBinding`

### 1.3.0

- Support the `Expression#around` hook, which executes code around both `interpret` and `add_content`

## 1.2.0

- Alter `Engine`/`Expression`/`ParentExpression` API to pass `keyword` and `args` to `#add_content` method. This enables consumers to vary behavior based on `keyword` and `args`, not just `parent` and presence of `block`.

## 1.1.2

- Add more logging for which DSL is assumed before interpreting expressions
- Switch DSL Engine puts statement to a log statement for the error about no DSLs available

## 1.1.1

- Ensured after_read hook truly happens after notifying observers in ModelBinding

## 1.1.0

- ModelBinding hooks for before_read, after_read, before_write, after_write

## 1.0.11

- Alias unregister as deregister everywhere
- Optimize performance of `Glimmer::Config.excluded_keyword_checkers` in glimmer method_missing

## 1.0.10

- Avoid using concurrent-ruby in Opal

## 1.0.9

- Fixed issue with top-level static expressions sometimes not working (e.g. async_exec in DSL for SWT) with DSL detected as nil

## 1.0.8

- Concurrent Array/Hash/Set data structures to better support parallel multi-threading
- Fix issue with a certain nil static_expression case not handled properly in Glimmer::DSL::Engine

## 1.0.7

- Refactor generated `__original_{method_name}` methods in `ObservableModel` to have double-underscore after the word "original" as `__original__{method_name}` to improve clarity that the method is generated via meta-programming of a pre-existing method
- Fix issue regarding testing array object observer on a nil object

## 1.0.6

- Update ModelBinding to raise an error if called to make a change while configurd as binding_options[:read_only]=true

## 1.0.5

- Fix issue in Opal regarding auto-definition of observable methods in a Class/Module directly (as opposed to a class instance)

## 1.0.4

- Ensure that `ObservableModel#remove_observer` clears observer registrations from `Observer` (just like `Observer#unobserve`)
- `ObservableModel#remove_observers` and `ObservableModel#remove_all_observers` methods

## 1.0.3

- Upgraded array_include_methods gem to v1.0.4

## 1.0.2

- Support ObservableArray notifications on `unshift`, `prepend`, and `append`

## 1.0.1

- Fixed issue with excluded keywords getting caught up by the infinite-loop-detection check
- Upgraded to array_include_method v1.0.3

## 1.0.0

- Code/Documentation preparation for version 1.0.0

## 0.10.4

- Support Glimmer::Config.log_excluded_keywords option for whether or not to log keywords that are excluded by Glimmer::Config.excluded_keyword_checkers

## 0.10.3

- Made Glimmer::Config module more resilient to invalid logger level values set via GLIMMER_LOGGER_LEVEL env var

## 0.10.2

- Added observer notification support for all Array mutation methods in ObservableArray (e.g. `delete_if`, `select!`, `uniq!`, `collect!`, etc...)

## 0.10.1

- excluded_keyword_checkers option for filtering certain keywords from Glimmer DSL processing
- Updates to logging levels to be more appropriate
- Fixed an issue to avoid crashing when calling observer.unregister/unobserve on a non-observable

## 0.10.0

- Remove Glimmer::Config.enable_logging method
- Refactor Glimmer config logger and reset level to error
- Update all logger calls to lazy blocks

## 0.9.5

- Removed resetting of DSL Engine upon encountering an exception as it is not needed and sometimes causes the wrong behavior

## 0.9.4

- Fix issue with observing attributes on classes directly instead of their objects

## 0.9.3

- Add infinite loop detection support to avoid infinite loops (breaks after 100 repetitions)
- Add Glimmer::Config option to specify loop max limit or disable completely
- ExcludedKeywordError with no logging for excluded keywords such as `to_a` and `to_h`

## 0.9.2

- Extracted common model data-binding classes from glimmer-dsl-swt

## 0.9.1

- Display error message if Glimmer DSL was invoked without any configured DSLs

## 0.9.0

- Extracted Glimmer DSL for SWT into glimmer-dsl-swt gem
- Extracted Glimmer DSL for XML into glimmer-dsl-xml gem
- Extracted Glimmer DSL for CSS into glimmer-dsl-css gem
- Introduced Glimmer DSL for Opal in glimmer-dsl-swt gem

## 0.8.2

- `message_box` DSL keyword
- Table single/multi selection databinding
- Table cell editing databinding
- Enhance table listener events with table_item and column_index methods
- Fix `Glimmer::SWT::ShellProxy#pack_same_size` for Linux

## 0.8.1

- Fix Glimmer::SWT::ShellProxy#pack_same_size for Windows

## 0.8.0

- Delegate listeners for menu items (:cascade) encapsulated by menus (dropdown menus)
- Make custom widget option method receive "default: hash key" instead of 2nd argument (adjusting scaffolding accordingly)
- Move about/preferences menu listeners from ShellProxy to DisplayProxy where they truly belong (adjusting scaffolding accordingly)

## 0.7.8

- Fix verbiage for summary/description in scaffolding custom shell gems (change custom widget reference to custom shell)
- Scaffolding builds a proper binary for custom shell gems and includes it in executables in Rakefile
- Scaffolding adds about/preferences menu actions to apps/custom-shell-gems
- Make custom widget/shell options writable
- Support "dialog" Glimmer DSL keyword

## 0.7.7

- Fix issue with scaffolding apps with dash in their name
- Make scaffolded custom shells launchable as standalone apps (native executables) too

## 0.7.6

- Support text widget selection data-binding explicitly
- Make specs pass on Linux
- Maintain tree item expansion on data-binding related changes
- Make scaffolded apps launch from bin file not app file

## 0.7.5

- Make :virtual a default tree SWT style
- Support Tree selection databinding (just like List)
- Support built-in Tree editing (i.e. editing tree item text)
- Support unregistering widget listeners
- Added tab item proxy dispose method that automatically unsets/disposes tab item inner control before disposing tab item itself

## 0.7.4

- Have tree data-binding auto-embed models as tree item data
- TreeProxy#depth_first_search implementation
- Support read-only data-binding

## 0.7.3

- Fix issue with rake tasks getting included twice
- Fix pack_same_size for shell_proxy
- Add pack_same_size to widget_proxy similar to that of shell_proxy

## 0.7.2

- Fix issue with data binding a nested value with an on_read converter block not getting triggered if model value was nil
- Fix issue with glimmer command triggered rake tasks not honoring glimmer application local Rakefile settings

## 0.7.1

- Fix crash issue with data-binding widget properties that are not supported in both directions
- Fix issue with scaffolding gems not having the right name
- Fix display of rdoc gem message on every glimmer app run
- Fix issues in closing a shell in girb
- Fix issue with Glimmer not clearing DSL Engine parent stacks when DSL interpretation raises exception
- Fix freezing issue upon logging observables and raising observable errors by overriding inspect on Observable to avoid printing nested tree of observers
- Added validation for shell widget parentage (accepting a shell or nil) in shell expression
- Support bidirectional data-binding of menu item selection (e.g. radio menu item)
- Make shell auto-activate on show with 0.25 delay

## 0.7.0

- Expose `rake glimmer:package` rake task via `glimmer package` command
- Scaffold a Glimmer app: provide a standard structure for building a Glimmer app (models, views, and assets [images, videos, sounds])
- Scaffold a Glimmer custom shell
- Scaffold a Glimmer custom widget
- Scaffold a Glimmer custom widget gem
- Scaffold a Glimmer custom shell gem
- Extract Video widget into its own custom widget glimmer-video gem
- Extract Gladiator into its own custom shell glimmer-gladiator gem
- Support disable_dsl/enable_dsl/enabled_dsls=
- Minify CSS produced by CSS DSL
- Avoid using p in CSS DSL as it clashes with HTML p. Use pv instead (property value).
- Configure scaffold rspec_helper with glimmer-appropriate after block
- Move logger/import_swt_packages methods on Glimmer to Glimmer::Config
- Reorganize samples as hello and elaborate inside samples directory

## 0.6.0

- Added multi-DSL support back to Glimmer
- Glimmer XML (HTML) DSL
- Glimmer CSS DSL
- Support mixing DSLs (e.g. SWT browser widget that has an XML text)
- Fixed Gladiator issue with not saving on quit
- Made color, rgb, and rgba SWT DSL static expressions instead of dynamic

## 0.5.11

- Added file and url attribute writers to `video` widget
- Fix Gladiator issue with empty replace text field
- Fix Gladiator issue with opening empty file
- Support picking up VERSION and LICENSE.txt files in glimmer:package rake task
- Update packaging to build app DMG file with humanized name (having spaces for multiple words) and to autoset a default mac bundle ID

## 0.5.10

- Fix video widget scrolling bar appearing issue
- Ensure on_about/on_preferences menu items are ignored on Windows
- Support SWT negative symbols postfixed by exclamation mark (e.g. :max! for no :max)
- Fix a bug in girb that made it not start anymore
- Fix a bug in Gladiator when jumping to line before a caret has been set

## 0.5.9

- Allow discovery of custom widgets without namespace if there are no existing classes with same name
- Add filters (global listeners) to SWT Display
- ShellProxy #pack and #pack_same_size methods
- Added Gladiator (Glimmer Editor) sample and command

## 0.5.8

- Support hooking into About and Preferences application menu items
- Support passing multiple SWT styles to a shell

## 0.5.7

- Make mixing Glimmer into a class enable Glimmer DSL in both class instance scope and singleton class scope
- Remove app_name and app_version since they show up from plist file upon Mac packaging
- Change default packaged app name (shows up in top menu bar on Mac) to humanized form (e.g. MathBowling becomes Math Bowling)
- Provide README instructions and easy packaging options for signing apps (Glimmer::Package.javapackager_extra_args)

## 0.5.6

- Add `rake glimmer:package:config` command to generate JAR config file
- Enabling passing extra args to javapackager via `JAVAPACKAGER_EXTRA_ARGS="..." rake glimmer:package`

## 0.5.5

- shell widget args for SWT Display app name and app version
- Glimmer DSL colors lazy initialize and don't have an SWT Display object dependency anymore
- Glimmer DSL Menu/MenuItem support

## 0.5.4

- Support custom data-binding property converters for nested/index data-binding
- Add glimmer command --log-level option
- Add glimmer command env var support
- Improvements to video widget (new methods and events to listen to)

## 0.5.3

- Upgraded rake dependency to 10.1.0 to avoid conflicting dependencies
- Stopped disposing display upon closing a shell to allow reuse
- Support custom data-binding property converters
- Automatic re-packing of shell when layout or layout data is updated with data-binding

## 0.5.2

- Support publishing a Glimmer app for the Mac (package as dmg file)
- Fix background_image widget property support to accept files in a JAR file
- Fix video widget support to accept files in a JAR file

## 0.5.0

- Upgraded SWT to version 4.15
- Upgraded to JRuby 9.2.11.1
- Refurbished/refactored Glimmer code design and APIs getting a performance boost
- Scraped XML and multi-DSL support
- Renamed `#add_contents` to `#content`
- made it configurable to include SWT Packages or not
- Supported color keyword for standard colors
- Supported swt keyword for style
- Supported async_exec/sync_exec keywords in Glimmer DSL directly
- Changed "def body" to body { } in custom widget/shell
- Renamed commands to keywords in Glimmer
- Made Glimmer::Launcher automatically figure out dev mode when run as bin/glimmer locally
- Added LOAD_PATH explicitly

## 0.4.9
- Added `org.eclipse.swt.custom` to default list of Glimmer SWT packages
- Added Custom Shell
- Made shell `#open` method remember if it was already opened before yet hidden, and just show the shell
- Implement shell `#hide` method
- Alias shell `#open` as `#show`
- Support CustomWidget/CustomShell Custom Property Observers
- Support on_*** observers on WidgetProxy's directly
- Support on_event_*** observers for SWT.constant event listeners (like show and hide)
- Added widget focus listener and data-binding support
- Support Glimmer DSL observe keyword and make it return observer registration object to unregister later on (unobserve)
- Support CustomWidget before_body and after_body hooks
- Make Glimmer DSL block provide parent Glimmer object (not SWT widget) as block argument
- Give widgets/custom-widgets ability to add content (properties/nested widgets) after construction via `#content` method
- Update setBackgroundImage to take an image path string for convenience (instead of an SWT image)

## 0.4.8
- Video widget
- Girb fix to auto-include Glimmer

## 0.4.7
- Fixed issues with custom widget support working for custom table, custom combo, custom list, parent of layout/layout-data, and on_*** observers
- Support for custom attributes/observers on a custom widget
- Display error message when using tab item widget NOT under a tab folder

## 0.4.6
- Added SWT 4.14 library jars directly in project

## 0.4.5
- SWT Browser widget support

## 0.4.4
- Glimmer Custom Widget support
- Support --debug flag

## 0.4.3
- Provide an easy way to make windows non-resizable
- Shorten needed :color_xyz symbols for known widget color properties like background and foreground to :xyz
- Friendly error message for passing a bad widget property font style (not normal, bold, italic)
- Friendly error message for passing a bad SWT style in general
- Support a single computed data binding as a string (not array)

## 0.4.2
- Center window upon opening
- Set window minimum width (130) upon opening
- Accept SWT Shell constructor arguments

## 0.4.1
- SWT Layout DSL support
- SWT Layout Data DSL support

## 0.4.0
- Changed `BlockObserver` into `Observer.proc`
- Added `Observer#proc` to create simple block-based observers.
- Updated Observer API renaming `#update` to `#call`
- Renamed `R` prefixed classes (i.e. Ruby) to `G` prefixed classes (i.e. Glimmer) (e.g. `RWidget` becomes `WidgetProxy`)
- Namespaced all of Glimmer's classes and modules under `Glimmer`
- Added `display` Glimmer DSL keyword to instantiate an SWT Display
- Removed `String` and `Symbol` monkey-patching
- Accept standard color value passed to widget color properties as `String` or `Symbol`

## 0.3.5
- Added font support to Glimmer DSL via name/height/style hash
- Added SWTProxy to easily build SWT constants (e.g. SWTProxy[:border] is SWT::BORDER )

## 0.3.4
- Fixed color support/property converter support to work both in data-binding and in static property setting

## 0.3.3
- Added color support to Glimmer DSL (rgb, rgba, and :color_*)

## 0.3.2
- Automatically import SWT packages when including/extending Glimmer
- Automatically enhance objects as ObservableArray or ObservableModel when observing them

## 0.3.1
- Fixed issue related to unnecessary tracking of parents in Observer

## 0.3.0
- Automatic cleanup of observers upon updating values in data-binding (nested/indexed) or disposing a widget
- Change of APIs whereby Observer class is responsible for registering observers with observables on properties

## 0.2.5
- Register a property type converter for `visible` property in widget binding, to ensure converting to boolean before setting in SWT widget.

## 0.2.4
- Added nested indexed computed property data binding support (e.g. bind(person, 'addresses[0].street_count', computed_by: ['addresses[0].streets']))

## 0.2.3
- Fixed nested indexed property data binding support for indexed leaf property (e.g. bind(person, 'names[1]'))

## 0.2.2
- Added nested indexed property data binding support (e.g. bind(person, 'addresses[1].street'))

## 0.2.0
- Upgraded to JRuby 9.2.10.0
- Fixed support for Windows & Linux
- Removed need to download SWT by including directly in gem for all platforms
- Simplified usage of glimmer command by preloading glimmer and not requiring setup

## 0.1.11.SWT4.14
- Upgraded SWT to version 4.14

## 0.1.11.470
- Nested property data binding support

## 0.1.10.470
- Support Tree data-binding (one-way from model to tree)

## 0.1.8.470
- girb support

## 0.1.5.470
- Glimmer now uses a Ruby Logger in debug mode to provide helpful debugging information
- Glimmer has a smart new Ruby shell script for executing applications
- Glimmer now downloads swt.jar automatically when missing (e.g. 1st run) on Mac, Windows, and Linux, and for x86 and x86-64 CPU architectures.
