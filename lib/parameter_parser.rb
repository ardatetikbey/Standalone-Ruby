require 'fileutils'
require 'tmpdir'
require 'optparse'
require 'rbconfig'

require_relative 'version/version'

class ParameterParser
  def initialize
    platform =
      case RUBY_PLATFORM
      when /win32|mingw|cygwin/
        'windows'
      when /linux/
        puts "Linux support is on the way!"
        exit!
      else
        print("Error: ".red); puts("unsupported platform")
        exit!
      end

    @params = {
      platform: platform,
      ruby: {
        version:      RUBY_VERSION,
        host_os:      RbConfig::CONFIG['host_os'],
        arch:         RbConfig::CONFIG['arch'],
        bindir:       RbConfig::CONFIG['bindir'],
        exe_path:     File.join(RbConfig::CONFIG['bindir'], RbConfig::CONFIG['ruby_install_name']),
        install_name: RbConfig::CONFIG['ruby_install_name'],
        libdir:       RbConfig::CONFIG['libdir'],
        rubylibdir:   RbConfig::CONFIG['rubylibdir'],
        sitelibdir:   RbConfig::CONFIG['sitelibdir'],
        vendordir:    RbConfig::CONFIG['vendordir'],
        prefix:       RbConfig::CONFIG['prefix'],
      },

      threads: 5,
      resource_file: File.join(File.expand_path("data/resource_files", __dir__), "default.rc"),
    }
  end


  def normalize_paths!
    @params.each do |key, value|
      @params[key] = value.gsub('\\', '/') if value.is_a?(String)
    end
  end

  def display_help
    windows_help_text = <<~EOT
      Standalone-Ruby v#{StandaloneRuby::VERSION} - Make Ruby independent!

      Usage: standalone-ruby [--help] [--project-path PROJECT_PATH] [--ruby-path RUBY_PATH] [--main-file MAIN_FILE] [--launcher LAUNCHER] [--gui] 
                             [--template TEMPLATE] [--exe-file EXE_FILE] [--threads THREADS] [--resource-file resource_file] [--gcc] [--version]

      Example: standalone-ruby --main-file MAIN_FILE_PATH --project-path PROJECT_PATH

      Required Options:
        --project-path PROJECT_PATH
            Target Ruby project path.
      
        --main-file MAIN_FILE
            Path to the main Ruby file of the project.

      Extra Options:
        --ruby RUBY_PATH
            Path to the Ruby interpreter.

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

    linux_help_text = <<~EOT
Version 2.0.0
EOT

    if @params[:platform] == 'windows'
      puts windows_help_text
    else
      puts linux_help_text
    end
  end

  def parse
    begin
      OptionParser.new do |opts|
        note = "Note: https://github.com/ardatetikbey/Standalone-Ruby Don't forget to review my github document to get the best results."
        opts.banner = "Usage: ruby #{$0} [options]\n#{note}"

        opts.on("--resource-file RESOURCE_FILE") do |resource_file|
          if File.exist?(resource_file)
            @params[:resource_file] = resource_file
          else
            print("Parser Error: ".red); puts("The specified resource file #{resource_file} could not be found!")
            exit!
          end
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

      if @params[:project_path].nil? || @params[:ruby][:prefix].nil? || @params[:main_file].nil?
        print("Error: ".red); puts("Missing required parameters. Please provide the necessary parameters:\n  --project-path, --main-file.\nYou can use the -h parameter for the help menu.")
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
