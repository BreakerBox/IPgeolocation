class IPinformation
  def initialize(author = "breaker")
 @__author__ = author
  end
  def banner()
    require 'ruby_figlet'
    using RubyFiglet
    puts "ipinfo".art "ANSI Shadow"
    puts "
 𝖛0.1\n"
  end
  def iplogger(ip)
    load '.IPinfo/token/token.rb'
    TokeN.decode_token()
  end
  def ipinfo(ip)
    require 'ipinfo'
    require 'httpclient'
    access_token = '91e04a23db492c'
    #handler = IPinfo::create(access_token)
    handler = IPinfo::create(access_token, {:http_client => HTTPClient})
    ip_address = ip
    begin
      details = handler.details(ip_address)
    rescue
      puts 'ip no encontrada'
      exit(1)
    end
    @details = details
  end
    def puts_ip_info()
      puts
      print "\e[32m[-]\e[0m \e[35mTarget:\e[0m       ", @details.ip_address
      puts
      print "\e[32m[-]\e[0m \e[35mIP:\e[0m           ", @details.ip
      puts
      begin
      print "\e[32m[-]\e[0m \e[35mCountry:\e[0m      ", @details.country_name
      rescue
      print "\e[32m[-]\e[0m \e[35mCountry:\e[0m —"
      end
      puts
      begin
      print "\e[32m[-]\e[0m \e[35mCountry name:\e[0m ", @details.country
      rescue 
      print "\e[32m[-]\e[0m \e[35mCountry name:\e[0m —"
      end
      puts
      begin
      print "\e[32m[-]\e[0m \e[35mCity name:\e[0m    ", @details.city
      rescue
      print "\e[32m[-]\e[0m \e[35mCity name:\e[0m —"
      end
      puts
      begin
      print "\e[32m[-]\e[0m \e[35mTimeZone:\e[0m     ", @details.timezone
      rescue
      print "\e[32m[-]\e[0m \e[35mTimeZone:\e[0m —"
      end
      puts
      begin
      print "\e[32m[-]\e[0m \e[35mRegion:\e[0m       ", @details.region
      rescue
      print "\e[32m[-]\e[0m \e[35mRegion:\e[0m —"
      end
      puts
      begin
      print "\e[32m[-]\e[0m \e[35mLatitude:\e[0m     ", lat = @details.latitude
      rescue
      print "\e[32m[-]\e[0m \e[35mLatitude:\e[0m —"
      end
      puts
      begin
      print "\e[32m[-]\e[0m \e[35mLongitude:\e[0m   ", lon = @details.longitude
      rescue
      print "\e[32m[-]\e[0m \e[35mLongitude:\e[0m —"
      end
      puts
      begin
      print "\e[32m[-]\e[0m \e[35mASN:\e[0m     ", @details.org
      rescue
      print "\e[32m[-]\e[0m \e[35mASN:\e[0m -"
      end
      puts
      begin
      print "\e[32m[-]\e[0m \e[35mGoogle Maps:\e[0m    http://www.google.com/maps/place/#{lat},#{lon}/@#{lat},#{lon},16z" if (@details.longitude.to_f.class == Float) || (@details.latitude.to_f.class == Float)
      rescue
      print "\e[32m[-]\e[0m \e[35mGoogle Maps:\e[0m —"
      end
      puts
    end
    def cache()
      @details.all
    end
end
