require_relative 'logger_helper'
require_relative '../version/version'

class Displayer
  def initialize(params)
    @params = params
    @logger = LoggerHelper.instance
  end

  def display_params
    begin
      display_map = {
        "Platform"       => @params[:platform],
        "Project Path"   => @params[:project_path],
        "Exe File"       => @params[:exe],
        "Ruby Path"      => @params[:ruby_path],
        "Ruby Folder"    => @params[:ruby_path] ? File.basename(@params[:ruby_path]) : nil,
        "Main File"      => @params[:main_file],
        "Launcher"       => @params[:launcher],
        "Launcher Type"  => @params[:launcher_type],
        "Template"       => @params[:template] || "Default Template",
        "Log Path"       => "Users Documents Directory"
      }

      display_text = display_map.map { |key, value| "#{key}: #{value}" if value }.compact

      puts display_text.join("\n") unless display_text.empty?

    rescue => e
      print("Display Error: ".red); puts(e.message.red)
      @logger.error("Display Error: #{e.message}")
    end
  end


  def banner
    banner = -<<"BANNER"
Standalone-Ruby v#{StandaloneRuby::VERSION} - Package your Ruby projects as exe!
  # Github: https://github.com/ardatetikbey/Standalone-Ruby
  # RubyGems: https://rubygems.org/gems/standalone-ruby

BANNER

    puts banner
  end
end

class String
  def red
    "\e[31m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end

  def magenta
    "\e[35m#{self}\e[0m"
  end

  def yellow
    "\e[33m#{self}\e[0m"
  end
end