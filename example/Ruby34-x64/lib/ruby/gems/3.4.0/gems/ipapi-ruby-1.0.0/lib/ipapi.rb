require 'httparty'

module Ipapi
  BASE_URL = "https://api.ipquery.io"
  def self.query_own_ip
    begin
      response = HTTParty.get(BASE_URL)

      if response
        puts response.body
      else
        puts("Error: #{response.code}")
      end
    rescue Exception => err
      puts("Error: #{err.message}")
    end
  end

  def self.query_ip(ip, format = "json")
    begin
      response = HTTParty.get("#{BASE_URL}/#{ip}?format=#{format}")

      if response
        puts response.body
      else
        puts("Error: #{response.code}")
      end
    rescue Exception => err
      puts("Error: #{err.message}")
    end
  end
end