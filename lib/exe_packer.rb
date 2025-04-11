require_relative 'logger_helper'

class ExePacker
  def initialize(params)
    @params = params
    @logger = LoggerHelper.instance
  end

  def pack
    begin
      stub_path = File.join(File.expand_path("data/exe_templates", __dir__), "launcher_stub.c")
      @logger.info("Reading stub template from: #{stub_path}")

      stub_content = File.read(stub_path)

      stub_output = "#{File.join(@params[:project_path].to_s, "launcher_stub.c")}"
      exe_path = "#{File.join(@params[:project_path].to_s, @params[:exe].to_s)}"

      File.open(stub_output, 'w') { |f| f.write(stub_content) }

      if @params[:use_gcc]
        puts "\nChecking GCC and Windres..."
        output = `where gcc`
        gcc_path = output.strip

        output = `where windres`
        windres_path = output.strip

        if File.exist?(output.strip)
          puts "GCC Path: #{gcc_path}"
          puts "Windres Path: #{windres_path}"

          windres_command = "#{windres_path} #{@params[:resource_file].to_s} -O coff -o #{File.join(@params[:project_path].to_s, "program.o")}"
          @logger.info("Running command: #{windres_command}")
          `#{windres_command}`

          gcc_command = "#{gcc_path} -o #{exe_path} #{File.join(@params[:project_path].to_s, "program.o")} #{stub_output}"
          @logger.info("Running command: #{gcc_command}")
          `#{gcc_command}`

          File.delete("#{File.join(@params[:project_path].to_s, 'program.o')}")
          @logger.info("program.o file deleted")
        else
          print("Error: ".red); puts("GCC could not be found!")
          exit!
        end
      else
        puts "\nUsing Tiny C Compiler (TCC)..."

        tcc_path = File.join(File.expand_path("data/c_compilers/tcc", __dir__), "tcc.exe")
        @logger.info("TCC Path: #{tcc_path}")

        command = "#{tcc_path} -o #{exe_path} #{stub_output} -lkernel32"
        @logger.info("Running command: #{command}")
        `#{command}`
      end

      File.delete(stub_output)
      @logger.info("Stub file deleted successfully")

      puts("\nExe file has been generated!".green_bold_dark)
      @logger.info("Exe file generated at: #{exe_path}")
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
