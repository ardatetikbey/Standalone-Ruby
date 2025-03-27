require_relative 'utils/logger_helper'
require_relative 'utils/displayer'
require_relative 'utils/parameter_parser'
require_relative 'utils/ruby_copy'
require_relative 'utils/launcher_handler'

$parser = ParameterParser.new
$parser.parse
$params = $parser.params

$logger = LoggerHelper.instance
$displayer = Displayer.new($params)
$ruby_copy = RubyCopy.new($params)
$launcher_handler = LauncherHandler.new($params)

def main
  Signal.trap("INT") do
    puts "\nProgram interrupted. Shutting down..."
    exit(0)
  end

  $displayer.banner
  $displayer.display_params

  $launcher_handler.handle
  $ruby_copy.robocopy_interpreter
end

main