require 'optparse'

class Launcher
  require_relative 'displayer'
  require_relative 'parameter_parser'
  require_relative 'ruby_copy'
  require_relative 'logger_helper'
  require_relative 'exe_packer'
  require_relative 'launcher_handler'
  # require_relative 'config_generator'

  def initialize
    @parser = ParameterParser.new
    @parser.parse
    @params = @parser.params

    @displayer = Displayer.new(@params)
    @ruby_copy = RubyCopy.new(@params)
    @logger = LoggerHelper.instance
    @exe_packer = ExePacker.new(@params)
    @launcher_handler = LauncherHandler.new(@params)
  end

  def platform_analysis
    case RUBY_PLATFORM
    when /win32|mingw|cygwin/
      @params[:platform] = 'Windows'
      @logger.info("Working on windows platform.")
    else
      print("Error: ".red); puts("This platform is not supported! Exiting...")
      @logger.error("This platform is not supported! Exiting...")
      exit!
    end
  end

  def run
    begin
      Signal.trap("INT") do
        @logger.info("The program was closed because an interrupt command was detected.")
        puts "\nProgram interrupted. Shutting down..."
        exit(0)
      end

      platform_analysis

      @logger.info("the executor function is started.")
      @displayer.banner
      @logger.info("Banner display was made.")
      @displayer.display_params
      @logger.info("The parameters entered by the user are reflected on the screen.")
      @ruby_copy.robocopy_interpreter
      @logger.info("Ruby interpreter copy function completed.")
      @launcher_handler.handle
      @logger.info("Launcher handler finished.")
      @exe_packer.pack
      @logger.info("Exe pack finished.")

      puts "Thanks for using Standalone-Ruby! Don't forget to star the project on Github."

      print("\nWARNING: ".yellow); puts("Instead of changing the path of the created exe file, create a shortcut. The same applies here as in every application.")
      @logger.info("Program finished.")
    rescue Exception => e
      @logger.error("Launcher Error: #{e.message}")
      print("Launcher Error: "); puts("#{e.message}".red)
    end
  end
end

class String
  def red
    "\e[31m#{self}\e[0m"
  end

  def yellow
    "\e[33m#{self}\e[0m"
  end
end
