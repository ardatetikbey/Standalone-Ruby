require 'fileutils'

class LauncherHandler
  def initialize(params)
    @params = params
  end

  def handle
    begin
      puts("\nThe template creation process has been started.")

      ruby_file = @params[:gui] ? "rubyw.exe" : "ruby.exe"

      if @params[:gui] == true
        vbs_template = File.join(File.expand_path("data/launcher_templates/vbs", __dir__), "vbs_gui.txt")
      else
        vbs_template = File.join(File.expand_path("data/launcher_templates/vbs", __dir__), "default_vbs.txt")
      end

      puts "Using: #{vbs_template}"

      if File.exist?(vbs_template)
        content = File.read(vbs_template)

        content.gsub!("STANDALONE_RUBY_PATH", "#{File.join(File.basename(@params[:ruby_path].to_s), "bin", "#{ruby_file}")}")
        content.gsub!("STANDALONE_MAIN_FILE", "#{File.basename(@params[:main_file].to_s)}")

        new_launcher_path = File.join(@params[:project_path].to_s, @params[:launcher_name].to_s)
        File.open(new_launcher_path, "w") do |f_man|
          f_man.puts content
        end

      else
        print("Handler Error: ".red); puts("The template file could not be found.")
        exit!
      end
    rescue Exception => e
      print("Handler Error: ".red); puts("#{e.message}")
    end
  end
end