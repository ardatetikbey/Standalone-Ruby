require 'logger'
require 'time'

class LoggerHelper
  def self.instance
    timestamp = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
    log_file = "program_logs/application_#{timestamp}.log"

    @logger ||= Logger.new(log_file)
    @logger.level = Logger::INFO

    @logger.formatter = proc do |severity, datetime, msg|
      "#{datetime.strftime('%Y-%m-%d %H:%M:%S')} [#{severity}] #{msg}\n"
    end

    return @logger
  end
end