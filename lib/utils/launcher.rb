require 'optparse'

class Launcher
  
  require_relative 'displayer'
  require_relative 'parameter_parser'
  require_relative 'ruby_copy'
  require_relative 'launcher_handler'
  # require_relative 'logger_helper'

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

    @displayer.banner
    @displayer.display_params

    @launcher_handler.handle
    @ruby_copy.robocopy_interpreter

    puts "Program Output Path: #{@params[:project_path]}"
    puts "Thanks for using Standalone-Ruby!"
  end
end