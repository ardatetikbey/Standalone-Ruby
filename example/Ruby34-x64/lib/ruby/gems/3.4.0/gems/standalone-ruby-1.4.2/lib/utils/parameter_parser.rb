require 'fileutils'
require 'optparse'

require_relative 'logger_helper'
require_relative '../version/version'

class ParameterParser
  def initialize
    @params = {
      threads: 5
    }

    @logger = LoggerHelper.instance
  end

  def normalize_paths!
    @params.each do |key, value|
      @params[key] = value.gsub('\\', '/') if value.is_a?(String)
    end
  end

  def display_help
    help_text = <<~EOT
      Standalone-Ruby v#{StandaloneRuby::VERSION} - Package your Ruby projects as exe!

      Usage: standalone-ruby [-h] [-p PROJECT_PATH] [-r RUBY_PATH] [-m MAIN_FILE] [-l LAUNCHER] [-t TEMPLATE] [-e EXE_FILE] [-c THREADS] [-g] [-v]

      Options:
        -p, --project PROJECT_PATH  Target Ruby project path.
            Ensures that the given project path exists. If not, an error is displayed.

        -r, --ruby RUBY_PATH        Path to the Ruby interpreter.
            Ensures that the given Ruby path exists and contains a 'bin' directory.

        -m, --main MAIN_FILE        Path to the main Ruby file of the project.
            Ensures that the specified Ruby file exists.

        -l, --launcher LAUNCHER     Launcher file name (either .vbs or .bat-cmd).
            Ensure the launcher file exists and is of the correct type (either .vbs or .bat-cmd).

        -t, --template TEMPLATE     Template file for launcher.
            Ensures that the specified template file exists.

        -e, --exe EXE_FILE           Name of the exe file to be used for output

        -c, --threads THREADS       Number of threads to use (default is 5).
            Determines the number of threads used during the Ruby interpreter copy process and for Rubocopy operations.
            A higher number of threads can speed up the process, but requires more system resources.
        
        -g, --gui                   This option allows the rubyw.exe file in the bin folder to be used.
            You can choose it for projects that include GUI.

        -h, --help                  Show this help message.

        -v, --version               Show program version.
      
      Notes:
        - Make sure that the Ruby interpreter you are using includes all the gems required for the target project.
        - The Ruby interpreter uses Robocopy for copying, and the number of threads given affects the speed of this operation.

      For more details, please visit the documentation at:
        https://github.com/ardatetikbey/Standalone-Ruby

    EOT

    puts help_text
  end

  def parse
    begin
      OptionParser.new do |opts|
        note = "Note: https://github.com/ardatetikbey/Standalone-Ruby Don't forget to review my github document to get the best results."
        opts.banner = "Usage: ruby #{$0} [options]\n#{note}"

        opts.on("-p", "--project PROJECT_PATH", String, "Target Ruby project path") do |project_path|
          project_path.strip!
          if Dir.exist?("#{project_path}")
            @params[:project_path] = project_path
          else
            print("Parser Error: ".red); puts("The specified project path #{project_path} could not be found!")
            @logger.error("Parser Error: The project path #{project_path} could not be found!")
            exit!
          end
        end

        opts.on("-e", "--exe EXE", "Exe file name") do |exe|
          @params[:exe] = exe
        end

        opts.on("-r", "--ruby RUBY_PATH", String, "Ruby interpreter path") do |ruby_path|
          ruby_path.strip!
          if Dir.exist?("#{ruby_path}")
            if Dir.exist?(File.join(ruby_path, "bin"))
              @params[:ruby_path] = ruby_path
            end
          else
            print("Parser Error: ".red); puts("The specified Ruby path #{ruby_path} could not be found!")
            @logger.error("Parser Error: The specified Ruby path #{ruby_path} could not be found!")
            exit!
          end
        end

        opts.on("--gcc") do
          @params[:use_gcc] = true
        end

        opts.on("-m", "--main MAIN_FILE", String, "Path to the main ruby file of the project") do |main_file|
          main_file.strip!
          if File.exist?(main_file)
            @params[:main_file] = main_file
          else
            print("Parser Error: ".red); puts("The specified file #{main_file} could not be found!")
            @logger.error("Parser Error: The specified file #{main_file} could not be found!")
            exit!
          end
        end

        opts.on("-c", "--threads THREADS", Integer, "Number of threads to use (default is 5)") do |threads|
          if threads.is_a?(Integer)
            @params[:threads] = threads
          else
            print("Parser Error: ".red); puts("Invalid value for threads. Please provide an integer.")
            @logger.error("Parser Error: Invalid value for threads.")
            exit!
          end
        end

        opts.on("-l", "--launcher LAUNCHER", String, "Launcher file name.type (vbs or bat-cmd)") do |launcher|
          launcher.strip!
          if launcher.include?(".vbs")
            @params[:launcher] = launcher
            @params[:launcher_type] = "vbs"
            @params[:launcher_name] = File.basename(launcher)
          elsif launcher.include?(".bat")
            @params[:launcher] = launcher
            @params[:launcher_type] = "bat"
            @params[:launcher_name] = File.basename(launcher)
          elsif launcher.include?(".cmd")
            @params[:launcher] = launcher
            @params[:launcher_type] = "cmd"
            @params[:launcher_name] = File.basename(launcher)
          else
            print("Parser Error: ".red); puts("The supported launcher #{launcher} could not be found!")
            @logger.error("Parser Error: The supported launcher path #{launcher} could not be found!")
            exit!
          end
        end

        opts.on("-t", "--template TEMPLATE", "Template file for launcher") do |template|
          template.strip!
          if File.exist?(template)
            @params[:template] = template
          else
            print("Parser Error: ".red); puts("The specified template file #{template} could not be found!")
            @logger.error("Parser Error: The specified template file #{template} could not be found!")
            exit!
          end
        end

        opts.on("-g", "--gui", "Project mode with visual interface") do
          @params[:gui] = true
        end

        opts.on("-v", "--version") do
          puts "Standalone Ruby Gem Version 1.4.1"
          exit!
        end

        opts.on("-h", "--help", "Show this help message") do
          display_help
          exit!
        end

        normalize_paths!
      end.parse!

      if @params[:project_path].nil? || @params[:ruby_path].nil? || @params[:main_file].nil?
        print("Error: ".red); puts("Missing required parameters. Please provide the necessary parameters:\n  -p, -r, -m.\nYou can use the -h parameter for the help menu.")
        @logger.error("Parser Error: Missing required parameters.")
        exit!
      end

    rescue Exception => e
      print("Parser Error: ".red); puts("#{e.message}".red)
      @logger.error("Parser Error: #{e.message}")
      exit!
    end
  end

  def params
    @params
  end
end

class String
  def red
    "\e[31m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end

  def magenta
    "\e[35m#{self}\e[0m"
  end

  def yellow
    "\e[33m#{self}\e[0m"
  end
end
