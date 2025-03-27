require 'optparse'
require 'fileutils'
require 'thread'
require 'io/console'


require_relative 'utils/logger_helper'

$params = Hash.new
$logger = LoggerHelper.instance

def parser
  begin
    OptionParser.new do |opts|
      note = "Note: https://github.com/ardatetikbey/Standalone-Ruby Don't forget to review my github document to get the best results."
      opts.banner = "Usage: ruby #{$0} [options]\n#{note}"

      opts.on("-p", "--project PROJECT_PATH", String, "Target Ruby project path") do |project_path|
        project_path.strip!
        if Dir.exist?("#{project_path}")
          $params[:project_path] = project_path
        else
          print("Parser Error: ".red); puts("The specified project path #{project_path} could not be found!")
          exit!
        end
      end

      opts.on("-r", "--ruby RUBY_PATH", String, "Ruby interpreter path") do |ruby_path|
        ruby_path.strip!
        if Dir.exist?("#{ruby_path}")
          if Dir.exist?(File.join(ruby_path, "bin"))
            $params[:ruby_path] = ruby_path
          end
        else
          print("Parser Error: ".red); puts("The specified Ruby path #{ruby_path} could not be found!")
          exit!
        end
      end

      opts.on("-m", "--main MAIN_FILE", String, "Path to the main ruby file of the project") do |main_file|
        main_file.strip!
        if File.exist?(main_file)
          $params[:main_file] = main_file
        else
          print("Parser Error: ".red); puts("The specified file #{main_file} could not be found!")
          exit!
        end
      end

      opts.on("-l", "--launcher LAUNCHER", String, "Launcher file name.type (vbs or bat)") do |launcher|
        launcher.strip!
        if launcher.include?(".vbs")
          $params[:launcher] = launcher
          $params[:launcher_type] = "vbs"
          $params[:launcher_name] = File.basename(launcher)
        elsif launcher.include?(".bat")
          $params[:launcher] = launcher
          $params[:launcher_type] = "bat"
          $params[:launcher_name] = File.basename(launcher)
        else
          print("Parser Error: ".red); puts("The supported launcher #{launcher} could not be found!")
          exit!
        end
      end

      opts.on("-t", "--template TEMPLATE", "Template file for launcher") do |template|
        template.strip!
        if File.exist?(template)
          $params[:template] = template
        else
          print("Parser Error: ".red); puts("The specified template file #{template} could not be found!")
          exit!
        end
      end
    end.parse!

    if $params.empty?
      print("Error: ".red); puts("No parameters provided. Please provide the necessary parameters.")
      exit!
    end
  rescue Exception => e
    print("Parser Error: ".red); puts ("#{e.message}".red)
  end
end

def banner
  banner = -<<'BANNER'

┌─┐┌┬┐┌─┐┌┐┌┌┬┐┌─┐┬  ┌─┐┌┐┌┌─┐  ┬─┐┬ ┬┌┐ ┬ ┬
└─┐ │ ├─┤│││ ││├─┤│  │ ││││├┤   ├┬┘│ │├┴┐└┬┘
└─┘ ┴ ┴ ┴┘└┘─┴┘┴ ┴┴─┘└─┘┘└┘└─┘  ┴└─└─┘└─┘ ┴ 

  # Github: https://github.com/ardatetikbey/Standalone-Ruby

BANNER

  puts banner
end

def display_advanced_help
  puts "help"
end

def display_params
  begin
    display_text = []

    display_text << "Project Path: #{$params[:project_path]}" if $params[:project_path]
    display_text << "Ruby Path: #{$params[:ruby_path]}" if $params[:ruby_path]
    display_text << "Ruby Folder: #{File.basename($params[:ruby_path])}" if $params[:ruby_path]
    display_text << "Main File: #{$params[:main_file]}" if $params[:main_file]
    display_text << "Launcher: #{$params[:launcher]}" if $params[:launcher]
    display_text << "Launcher Type: #{$params[:launcher_type]}" if $params[:launcher_type]
    display_text << "Template: #{$params[:template]}" if $params[:template]
    display_text << "Template: Default Template" unless $params[:template]

    puts display_text.join("\n") unless display_text.empty?

  rescue Exception => e
    print("Display Error: ".red); puts("#{e.message}".red)
  end
end

def launcher_handler
  begin
    puts("\nThe template creation process has been started.")

    if $params[:template]
      user_template = $params[:template]
      content = File.read(user_template)

      content.gsub!("STANDALONE_RUBY_PATH", "#{File.join(File.basename($params[:ruby_path].to_s), "bin", "ruby.exe")}")
      content.gsub!("STANDALONE_MAIN_FILE", "#{File.basename($params[:main_file].to_s)}")

      new_launcher_path = File.join($params[:project_path].to_s, $params[:launcher_name].to_s)

      File.open(new_launcher_path, "w") do |f_man|
        f_man.puts content
      end
    else
      if $params[:launcher_type] == "vbs"
        vbs_template = File.join(File.expand_path("launcher_templates/vbs", __dir__), "default_vbs.txt")
        puts "Using: #{vbs_template}"

        if File.exist?(vbs_template)
          content = File.read(vbs_template)

          content.gsub!("STANDALONE_RUBY_PATH", "#{File.join(File.basename($params[:ruby_path].to_s), "bin", "ruby.exe")}")
          content.gsub!("STANDALONE_MAIN_FILE", "#{File.basename($params[:main_file].to_s)}")

          new_launcher_path = File.join($params[:project_path].to_s, $params[:launcher_name].to_s)

          File.open(new_launcher_path, "w") do |f_man|
            f_man.puts content
          end
        else
          print("Handler Error: ".red); puts("Template file not found!")
          exit!
        end
      else
        bat_template = File.join(File.expand_path("launcher_templates/bat", __dir__), "default_bat.txt")
        puts "Using: #{bat_template}"

        if File.exist?(bat_template)
          content = File.read(bat_template)

          content.gsub!("STANDALONE_RUBY_PATH", "#{File.join(File.basename($params[:ruby_path].to_s), "bin", "ruby.exe")}")
          content.gsub!("STANDALONE_MAIN_FILE", "#{File.basename($params[:main_file].to_s)}")

          new_launcher_path = File.join($params[:project_path].to_s, $params[:launcher_name].to_s)

          File.open(new_launcher_path, "w") do |f_man|
            f_man.puts content
          end
        else
          print("Handler Error: ".red); puts("The template file could not be found.")
          exit!
        end
      end
    end
  rescue Exception => e
    print("Handler Error: ".red); puts("#{e.message}")
  end
end

def robocopy_interpreter
  begin
    puts("\nThe Ruby interpreter copying process has been started.")
    print("WARNING: ".yellow); puts("If you are using a development kit, the copying process may take a long time.")

    copy_output = `robocopy "#{$params[:ruby_path]}" "#{File.join($params[:project_path].to_s, File.basename($params[:ruby_path].to_s))}" /E /MT:16 /V /ETA /NFL /NDL /R:1000000 /W:30 /NP`
    puts copy_output

    puts("The Ruby interpreter copying process has been completed.")
  rescue Exception => e
    print("Copy Error: ".red); puts("#{e.message}".red)
  end
end

def main
  Signal.trap("INT") do
    puts "\nProgram interrupted. Shutting down..."
    exit(0)
  end

  parser
  banner
  display_params
  launcher_handler
  robocopy_interpreter
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

main