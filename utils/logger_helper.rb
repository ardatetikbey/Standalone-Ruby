require 'logger'
require 'time'
require 'fileutils'

class LoggerHelper
  def self.instance
    log_directory = 'program_logs'
    FileUtils.mkdir_p(log_directory) unless Dir.exist?(log_directory)

    timestamp = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
    log_file = "#{log_directory}/application_#{timestamp}.log"

    @logger ||= Logger.new(log_file)
    @logger.level = Logger::INFO

    @logger.formatter = proc do |severity, datetime, msg|
      "#{datetime.strftime('%Y-%m-%d %H:%M:%S')} [#{severity}] #{msg}\n"
    end

    return @logger
  end
end
