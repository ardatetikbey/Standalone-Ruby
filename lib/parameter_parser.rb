require 'fileutils'
require 'tmpdir'
require 'optparse'

require_relative 'version/version'

class ParameterParser
  def initialize
    @params = {
      threads: 5,
      sfx_path: Dir.tmpdir,
      exe: "program.exe",
      resource_file: File.join(File.expand_path("data/resource_files", __dir__), "default.rc"),
      launcher: "launcher.vbs",
      launcher_name: "launcher.vbs",
      launcher_type: "vbs"
    }

  end

  def normalize_paths!
    @params.each do |key, value|
      @params[key] = value.gsub('\\', '/') if value.is_a?(String)
    end
  end

  def display_help
    help_text = <<~EOT
      Standalone-Ruby v#{StandaloneRuby::VERSION} - Convert your Ruby projects to exe files!

      Usage: standalone-ruby [--help] [--project-path PROJECT_PATH] [--ruby-path RUBY_PATH] [--main-file MAIN_FILE] [--launcher LAUNCHER] [--gui] 
                             [--template TEMPLATE] [--exe-file EXE_FILE] [--threads THREADS] [--resource-file resource_file] [--gcc] [--version]

      Required Options:
        --project-path PROJECT_PATH
            Target Ruby project path.
      
        --ruby RUBY_PATH
            Path to the Ruby interpreter.
      
        --main-file MAIN_FILE
            Path to the main Ruby file of the project.

      Extra Options:
        --exe-file EXE_FILE
            Name of the exe file to be used for output (default is program.exe).
      
        --threads THREADS
            Number of threads to use (default is 5). Determines the number of threads used during the Ruby interpreter
            copy process and for Robocopy operations. A higher number of threads can speed up the process, but requires more system resources.
      
        --resource-file RESOURCE_FILE
            Resource file (.rc) for the exe file to be created. Only possible with MinGW.
      
        --help
            Show this help message and exit.
      
        --version
            Show program version and exit.
      
        --gcc
            Use GCC compiler for exe file.
            
        --gui
            This option allows the rubyw.exe file in the bin folder to be used.
            You can choose it for projects that include GUI.

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

        opts.on("--sfx-path SFX_PATH") do |sfx_path|
          @params[:sfx_path] = sfx_path
        end

        opts.on("--resource-file RESOURCE_FILE") do |resource_file|
          if File.exist?(resource_file)
            @params[:resource_file] = resource_file
          else
            print("Parser Error: ".red); puts("The specified resource file #{resource_file} could not be found!")
            exit!
          end
        end

        opts.on("--one-file-exe") do
          @params[:one_file_exe] = true
        end

        opts.on("--ruby-path RUBY_PATH") do |ruby_path|
          ruby_path.strip!
          if Dir.exist?("#{ruby_path}")
            if Dir.exist?(File.join(ruby_path, "bin"))
              @params[:ruby_path] = ruby_path
            end
          else
            print("Parser Error: ".red); puts("The specified Ruby path #{ruby_path} could not be found!")
            exit!
          end
        end

        opts.on("--project-path PROJECT_PATH", String) do |project_path|
          project_path.strip!
          if Dir.exist?("#{project_path}")
            @params[:project_path] = project_path
          else
            print("Parser Error: ".red); puts("The specified project path #{project_path} could not be found!")
            exit!
          end
        end

        opts.on("--exe-file EXE_FILE") do |exe|
          @params[:exe] = exe
        end

        opts.on("--gcc") do
          @params[:use_gcc] = true
        end

        opts.on("--main-file MAIN_FILE", String) do |main_file|
          main_file.strip!
          if File.exist?(main_file)
            @params[:main_file] = main_file
          else
            print("Parser Error: ".red); puts("The specified file #{main_file} could not be found!")
            exit!
          end
        end

        opts.on("--threads THREADS", Integer) do |threads|
          if threads.is_a?(Integer)
            @params[:threads] = threads
          else
            print("Parser Error: ".red); puts("Invalid value for threads. Please provide an integer.")
            exit!
          end
        end

        opts.on("--gui") do
          @params[:gui] = true
        end

        opts.on("--version") do
          puts "Standalone Ruby Gem Version #{StandaloneRuby::VERSION}"
          exit!
        end

        opts.on("--help") do
          display_help
          exit!
        end
      end.parse!

      normalize_paths!

      if @params[:project_path].nil? || @params[:ruby_path].nil? || @params[:main_file].nil?
        print("Error: ".red); puts("Missing required parameters. Please provide the necessary parameters:\n  -p, -r, -m.\nYou can use the -h parameter for the help menu.")
        exit!
      end

    rescue Exception => e
      print("Parser Error: ".red); puts("#{e.message}".red)
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
