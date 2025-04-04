require 'fileutils'

require_relative 'logger_helper'

class LauncherHandler
  def initialize(params)
    @params = params
    @logger = LoggerHelper.instance
  end

  def handle
    begin
      puts("\nThe template creation process has been started.")

      if @params[:template]
        if @params[:gui] == true
          ruby_file = "rubyw.exe"
        else
          ruby_file = "ruby.exe"
        end

        user_template = @params[:template].to_s
        content = File.read(user_template)
        @logger.info("The content of the user template has been read.")

        content.gsub!("STANDALONE_RUBY_PATH", "#{File.join(File.basename(@params[:ruby_path].to_s), "bin", "#{ruby_file}")}")
        @logger.info("Placed the defined Ruby interpreter path in the template.")

        content.gsub!("STANDALONE_MAIN_FILE", "#{File.basename(@params[:main_file].to_s)}")
        @logger.info("The main project file path defined in the template is placed.")

        new_launcher_path = File.join(@params[:project_path].to_s, @params[:launcher_name].to_s)
        File.open(new_launcher_path, "w") do |f_man|
          f_man.puts content
        end

        @logger.info("New launcher file directory created as #{new_launcher_path.to_s}")
      else
        if @params[:launcher_type] == "vbs"
          if @params[:gui] == true
            vbs_template = File.join(File.expand_path("../data/vbs", __dir__), "vbs_gui.txt")
            ruby_file = "rubyw.exe"
          else
            vbs_template = File.join(File.expand_path("../data/vbs", __dir__), "default_vbs.txt")
            ruby_file = "ruby.exe"
          end

          puts "Using: #{vbs_template}"

          if File.exist?(vbs_template)
            content = File.read(vbs_template)
            @logger.info("The content of the template has been read.")

            content.gsub!("STANDALONE_RUBY_PATH", "#{File.join(File.basename(@params[:ruby_path].to_s), "bin", "#{ruby_file}")}")
            @logger.info("Placed the defined Ruby interpreter path in the template.")

            content.gsub!("STANDALONE_MAIN_FILE", "#{File.basename(@params[:main_file].to_s)}")
            @logger.info("The main project file path defined in the template is placed.")

            new_launcher_path = File.join(@params[:project_path].to_s, @params[:launcher_name].to_s)
            File.open(new_launcher_path, "w") do |f_man|
              f_man.puts content
            end

            @logger.info("New launcher file directory created as #{new_launcher_path.to_s}")
          else
            print("Handler Error: ".red); puts("The template file could not be found.")
            @logger.error("Template file not found!")
            exit!
          end
        else
          if @params[:gui] == true
            ruby_file = "rubyw.exe"
          else
            ruby_file = "ruby.exe"
          end

          bat_template = File.join(File.expand_path("../data/bat-cmd", __dir__), "default_bat_cmd.txt")
          puts "Using: #{bat_template}"

          if File.exist?(bat_template)
            content = File.read(bat_template)
            @logger.info("The content of the template has been read.")

            content.gsub!("STANDALONE_RUBY_PATH", "#{File.join(File.basename(@params[:ruby_path].to_s), "bin", "#{ruby_file}")}")
            @logger.info("Placed the defined Ruby interpreter path in the template.")

            content.gsub!("STANDALONE_MAIN_FILE", "#{File.basename(@params[:main_file].to_s)}")
            @logger.info("The main project file path defined in the template is placed.")

            new_launcher_path = File.join(@params[:project_path].to_s, @params[:launcher_name].to_s)
            File.open(new_launcher_path, "w") do |f_man|
              f_man.puts content
            end

            @logger.info("New launcher file directory created as #{new_launcher_path.to_s}")
          else
            print("Handler Error: ".red); puts("The template file could not be found.")
            @logger.error("Handler Error: Template file not found!")
            exit!
          end
        end
      end
    rescue Exception => e
      print("Handler Error: ".red); puts("#{e.message}")
      @logger.error("Handler Error: #{e.message}")
    end
  end
end