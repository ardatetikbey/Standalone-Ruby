require_relative 'version/version'

class Displayer
  def initialize(params)
    @params = params
  end

  def display_params
    begin
      puts("Working with:")

      display_map = {
        "Platform" => @params[:platform],
        "Project Path"   => @params[:project_path],
        "Resource File" => @params[:resource_file],
        "Exe File"       => "program.exe",
        "Prefix"      => @params[:ruby][:prefix],
        "Main File"      => @params[:main_file],
        "Launcher"       => "launcher.vbs",
        "Template"       => "Default Template",
      }

      display_text = display_map.map { |key, value| "  - #{key}: #{value}" if value }.compact

      puts display_text.join("\n") unless display_text.empty?

    rescue => e
      print("Display Error: ".red); puts(e.message.red)
    end
  end


  def banner
    banner = -<<"BANNER"
Standalone-Ruby v#{StandaloneRuby::VERSION} - Make Ruby independent!
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