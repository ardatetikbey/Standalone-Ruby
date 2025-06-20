class ExePacker
  def initialize(params)
    @params = params
  end

  def pack_linux
    puts
  end

  def pack_windows
    begin
      stub_path = File.join(File.expand_path("data/exe_templates", __dir__), "launcher_stub.c")
      stub_content = File.read(stub_path)

      stub_output = "#{File.join(@params[:project_path].to_s, "launcher_stub.c")}"
      exe_path = "#{File.join(@params[:project_path].to_s, "program.exe")}"

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
          `#{windres_command}`

          gcc_command = "#{gcc_path} -o #{exe_path} #{File.join(@params[:project_path].to_s, "program.o")} #{stub_output}"
          `#{gcc_command}`

          File.delete("#{File.join(@params[:project_path].to_s, 'program.o')}")
        else
          print("Error: ".red); puts("GCC could not be found!")
          exit!
        end
      else
        puts "\nUsing Tiny C Compiler (TCC)..."

        tcc_path = File.join(File.expand_path("data/c_compilers/tcc", __dir__), "tcc.exe")
        command = "#{tcc_path} -o #{exe_path} #{stub_output} -lkernel32"
        `#{command}`
      end

      File.delete(stub_output)

      puts("\nExe file has been generated!")
    rescue Exception => err
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
