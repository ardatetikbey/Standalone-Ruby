require_relative 'logger_helper'

class ExePacker
  def initialize(params)
    @params = params
    @logger = LoggerHelper.instance
  end

  def pack
    begin
      stub_path = File.join(File.expand_path("../data/exe_template", __dir__), "launcher_stub.c")
      @logger.info("Reading stub template from: #{stub_path}")

      stub_content = File.read(stub_path)
      stub_content.gsub!("LAUNCHER_FILE", "#{File.basename(@params[:launcher])}")

      stub_output = "#{File.join(@params[:project_path].to_s, "launcher_stub.c")}"
      exe_path = "#{File.join(@params[:project_path].to_s, @params[:exe].to_s)}"

      File.open(stub_output, 'w') { |f| f.write(stub_content) }

      if @params[:use_gcc]
        puts "\nChecking GCC..."
        output = `where gcc`

        if File.exist?(output.strip)
          gcc_path = output.strip
          puts "GCC Path: #{gcc_path}"

          command = "#{gcc_path} -o #{exe_path} #{stub_output}"
          @logger.info("Running command: #{command}")
          `#{command}`
        else
          print("Error: ".red); puts("GCC could not be found!");
          exit!
        end
      else
        puts "\nUsing TCC..."

        tcc_path = File.join(File.expand_path("../data/tcc", __dir__), "tcc.exe")
        @logger.info("TCC Path: #{tcc_path}")

        command = "#{tcc_path} -o #{exe_path} #{stub_output} -lkernel32"
        @logger.info("Running command: #{command}")
        `#{command}`
      end

      File.delete(stub_output)
      @logger.info("Stub file deleted successfully")

      puts("\nExe file has been generated!".green_bold_dark)
      @logger.info("Exe file generated successfully at: #{exe_path}")
    rescue Exception => err
      @logger.error("Error occurred: #{err.message}")
      print("Error: ".red); puts(err.message)
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

  def green_bold_dark
    "\e[1m\e[38;5;28m#{self}\e[0m"
  end
end
