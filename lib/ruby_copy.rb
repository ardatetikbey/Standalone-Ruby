class RubyCopy
  def initialize(params)
    @params = params
  end

  def rsync_interpreter
    begin
      puts("\nRuby interpreter copying process started using rsync.")

      source = @params[:ruby_path]
      dest = File.join(@params[:project_path].to_s, File.basename(source.to_s))

      rsync_command = "rsync -avh --progress \"#{source}/\" \"#{dest}/\""
      puts "Rsync Command: #{rsync_command}"

      `#{rsync_command}`

      puts("The Ruby interpreter copying process has been completed.")
    rescue Exception => e
      print("Copy Error: ".red)
      puts("#{e.message}".red)
    end
  end

  def robocopy_interpreter
    begin
      puts("\nThe Ruby interpreter copying process has been started.")
      print("WARNING: ".yellow)
      puts("If you are using a development kit, the copying process may take a long time.")

      source = @params[:ruby_path]
      dest = File.join(@params[:project_path].to_s, File.basename(source.to_s))

      robocopy_command = <<~CMD.strip
  robocopy "#{source}" "#{dest}" /E /MT:#{@params[:threads].to_i} /R:2 /W:2 /NP /NFL /NDL
CMD

      puts "Robocopy Command: #{robocopy_command}"

      `#{robocopy_command}`

      puts("The Ruby interpreter copying process has been completed.")
    rescue Exception => e
      print("Copy Error: ".red)
      puts("#{e.message}".red)
    end
  end
end
