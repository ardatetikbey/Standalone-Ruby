require 'fileutils'

class LauncherHandler
  def initialize(params)
    @params = params
  end

  def handle
    begin
      puts("\nThe template creation process has been started.")

      if @params[:template]
        user_template = @params[:template].to_s
        content = File.read(user_template)

        content.gsub!("STANDALONE_RUBY_PATH", "#{File.join(File.basename(@params[:ruby_path].to_s), "bin", "ruby.exe")}")
        content.gsub!("STANDALONE_MAIN_FILE", "#{File.basename(@params[:main_file].to_s)}")

        new_launcher_path = File.join(@params[:project_path].to_s, @params[:launcher_name].to_s)

        File.open(new_launcher_path, "w") do |f_man|
          f_man.puts content
        end
      else
        if @params[:launcher_type] == "vbs"
          vbs_template = File.join(File.expand_path("../data/vbs", __dir__), "default_vbs.txt")
          puts "Using: #{vbs_template}"

          if File.exist?(vbs_template)
            content = File.read(vbs_template)

            content.gsub!("STANDALONE_RUBY_PATH", "#{File.join(File.basename(@params[:ruby_path].to_s), "bin", "ruby.exe")}")
            content.gsub!("STANDALONE_MAIN_FILE", "#{File.basename(@params[:main_file].to_s)}")

            new_launcher_path = File.join(@params[:project_path].to_s, @params[:launcher_name].to_s)

            File.open(new_launcher_path, "w") do |f_man|
              f_man.puts content
            end
          else
            print("Handler Error: ".red); puts("Template file not found!")
            exit!
          end
        else
          bat_template = File.join(File.expand_path("../data/bat", __dir__), "default_bat.txt")
          puts "Using: #{bat_template}"

          if File.exist?(bat_template)
            content = File.read(bat_template)

            content.gsub!("STANDALONE_RUBY_PATH", "#{File.join(File.basename(@params[:ruby_path].to_s), "bin", "ruby.exe")}")
            content.gsub!("STANDALONE_MAIN_FILE", "#{File.basename(@params[:main_file].to_s)}")

            new_launcher_path = File.join(@params[:project_path].to_s, @params[:launcher_name].to_s)

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
end