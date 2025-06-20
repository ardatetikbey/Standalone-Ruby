require 'optparse'

require_relative 'displayer'
require_relative 'parameter_parser'
require_relative 'ruby_copy'
require_relative 'exe_packer'
require_relative 'launcher_handler'

class Launcher
  def initialize
    @parser = ParameterParser.new
    @parser.parse
    @params = @parser.params

    @displayer = Displayer.new(@params)
    @ruby_copy = RubyCopy.new(@params)
    @exe_packer = ExePacker.new(@params)
    @launcher_handler = LauncherHandler.new(@params)
  end

  def run
    begin
      Signal.trap("INT") do
        puts "\nProgram interrupted. Shutting down..."
        exit(0)
      end

      @displayer.banner
      @displayer.display_params

      if @params[:platform] == 'windows'
        @ruby_copy.robocopy_interpreter
        @launcher_handler.handle
        @exe_packer.pack_windows
      elsif @params[:platform] == 'linux'
        @ruby_copy.rsync_interpreter
        @exe_packer.pack_linux
      end

      print("\nWARNING: ".yellow); puts("Instead of changing the path of the created exe file, create a shortcut. The same applies here as in every application.")

      puts("\nThis project is under development. If you encounter any errors, you can open an issue on Github.\nIf you want to make a suggestion, you can contact me.")
      puts "Thanks for using Standalone-Ruby! Don't forget to star the project on Github."
    rescue Exception => e
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
