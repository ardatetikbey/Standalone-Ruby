require 'optparse'

class Launcher
  require_relative 'displayer'
  require_relative 'parameter_parser'
  require_relative 'ruby_copy'
  require_relative 'launcher_handler'
  require_relative 'logger_helper'

  def initialize
    @parser = ParameterParser.new
    @parser.parse
    @params = @parser.params

    @displayer = Displayer.new(@params)
    @ruby_copy = RubyCopy.new(@params)
    @launcher_handler = LauncherHandler.new(@params)
    @logger = LoggerHelper.instance
  end

  def platform_analysis
    case RUBY_PLATFORM
    when /win32|mingw|cygwin/
      @params[:platform] = 'Windows'
      @logger.info("Working on windows platform.")
    when /darwin/
      print("Error: ".red); puts("Mac OS platform is not supported at the moment! Exiting...")
      @logger.error("Mac OS platform is not supported at the moment! Exiting...")
      exit!
    when /linux/
      print("Error: ".red); puts("Linux platform is not supported at the moment! Exiting...")
      @logger.error("Linux platform is not supported at the moment! Exiting...")
      exit!
    else
      "#{RUBY_PLATFORM}"
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
      @logger.info("The initiator file creator function has started processing.")
      @launcher_handler.handle
      @logger.info("The launcher file creator has finished its function.")
      @ruby_copy.robocopy_interpreter
      @logger.info("Ruby interpreter copy function completed.")

      puts "Program Output Path: #{@params[:project_path]}"
      puts "Thanks for using Standalone-Ruby!"
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
