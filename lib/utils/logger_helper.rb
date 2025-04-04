require 'logger'
require 'time'
require 'fileutils'

class LoggerHelper
  def self.instance
    documents_path = File.join(ENV['USERPROFILE'], 'Documents', 'standalone-ruby-logs')

    FileUtils.mkdir_p(documents_path) unless Dir.exist?(documents_path)

    timestamp = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
    log_file = File.join(documents_path, "standalone-ruby_#{timestamp}.log")

    logger = Logger.new(log_file)
    logger.level = Logger::INFO

    logger.formatter = proc do |severity, datetime, progname, msg|
      msg = "(empty message)" if msg.nil? || msg.strip.empty?
      "#{datetime.strftime('%Y-%m-%d %H:%M:%S')} [#{severity}] #{msg}\n"
    end

    return logger
  end
end
