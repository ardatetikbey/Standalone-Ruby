require 'fileutils'
require 'optparse'

class ParameterParser
  def initialize
    @params = {}
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
            exit!
          end
        end

        opts.on("-r", "--ruby RUBY_PATH", String, "Ruby interpreter path") do |ruby_path|
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

        opts.on("-m", "--main MAIN_FILE", String, "Path to the main ruby file of the project") do |main_file|
          main_file.strip!
          if File.exist?(main_file)
            @params[:main_file] = main_file
          else
            print("Parser Error: ".red); puts("The specified file #{main_file} could not be found!")
            exit!
          end
        end

        opts.on("-l", "--launcher LAUNCHER", String, "Launcher file name.type (vbs or bat)") do |launcher|
          launcher.strip!
          if launcher.include?(".vbs")
            @params[:launcher] = launcher
            @params[:launcher_type] = "vbs"
            @params[:launcher_name] = File.basename(launcher)
          elsif launcher.include?(".bat")
            @params[:launcher] = launcher
            @params[:launcher_type] = "bat"
            @params[:launcher_name] = File.basename(launcher)
          else
            print("Parser Error: ".red); puts("The supported launcher #{launcher} could not be found!")
            exit!
          end
        end

        opts.on("-t", "--template TEMPLATE", "Template file for launcher") do |template|
          template.strip!
          if File.exist?(template)
            @params[:template] = template
          else
            print("Parser Error: ".red); puts("The specified template file #{template} could not be found!")
            exit!
          end
        end
      end.parse!

      if @params.empty?
        print("Error: ".red); puts("No parameters provided. Please provide the necessary parameters.")
        exit!
      end
    rescue Exception => e
      print("Parser Error: ".red); puts("#{e.message}".red)
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