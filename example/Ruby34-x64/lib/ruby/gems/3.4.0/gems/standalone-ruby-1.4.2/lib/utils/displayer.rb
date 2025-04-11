require_relative 'logger_helper'
require_relative '../version/version'

class Displayer
  def initialize(params)
    @params = params
    @logger = LoggerHelper.instance
  end

  def display_params
    begin
      display_text = []

      display_text << "Platform: #{@params[:platform]}" if @params[:platform]
      display_text << "Project Path: #{@params[:project_path]}" if @params[:project_path]
      display_text << "Exe File: #{@params[:exe]}" if @params[:exe]
      display_text << "Ruby Path: #{@params[:ruby_path]}" if @params[:ruby_path]
      display_text << "Ruby Folder: #{File.basename(@params[:ruby_path])}" if @params[:ruby_path]
      display_text << "Main File: #{@params[:main_file]}" if @params[:main_file]
      display_text << "Launcher: #{@params[:launcher]}" if @params[:launcher]
      display_text << "Launcher Type: #{@params[:launcher_type]}" if @params[:launcher_type]
      display_text << "Template: #{@params[:template]}" if @params[:template]
      display_text << "Template: Default Template" unless @params[:template]
      display_text << "Log Path: Users Documents Directory"

      puts display_text.join("\n") unless display_text.empty?

    rescue Exception => e
      print("Display Error: ".red); puts("#{e.message}".red)
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