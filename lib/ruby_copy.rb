class RubyCopy
  def initialize(params)
    @params = params
  end

  def robocopy_interpreter
    begin
      puts("\nThe Ruby interpreter copying process has been started.")
      print("WARNING: ".yellow); puts("If you are using a development kit, the copying process may take a long time.")

      copy_output = `robocopy "#{@params[:ruby_path]}" "#{File.join(@params[:project_path].to_s, File.basename(@params[:ruby_path].to_s))}" /E /MT:#{@params[:threads].to_i} /V /ETA /NFL /NDL /R:1000000 /W:30 /NP`
      puts "Robocopy Command: robocopy \"#{@params[:ruby_path]}\" \"#{File.join(@params[:project_path], File.basename(@params[:ruby_path]))}\" /E /MT:#{@params[:threads].to_i} /V /ETA /NFL /NDL /R:1000000 /W:30 /NP"


      puts("The Ruby interpreter copying process has been completed.")
    rescue Exception => e
      print("Copy Error: ".red); puts("#{e.message}".red)
    end
  end
end