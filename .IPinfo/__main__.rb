class IPinformation
  def initialize(author = "breaker")
 @__author__ = author
  end
  def banner(font)
    @font = font
    puts '  IP  info'.art @font
    puts "
 𝖛0.1\n"
  end
  def help()
    banner('Bloody')
  end
  def iplogger(ip)
    load '.IPinfo/.token/token.rb'
    TokeN.decode_token()
  end
  def ipinfo(ip)
    require 'ipinfo'
    require 'httpclient'
    access_token = '91e04a23db492c'
    #handler = IPinfo::create(access_token)
    handler = IPinfo::create(access_token, {:http_client => HTTPClient})
    ip_address = ip
    details = handler.details(ip_address)
    @details = details
  end
    def puts_ip_info()
      puts
      print "\e[32m[-]\e[0m \e[34mTarget:\e[0m       ", @details.ip_address
      puts
      print "\e[32m[-]\e[0m \e[34mIP:\e[0m           ", @details.ip
      puts
      print "\e[32m[-]\e[0m \e[34mCountry:\e[0m      ", @details.country_name
      puts
      print "\e[32m[-]\e[0m \e[34mCountry name:\e[0m ", @details.country
      puts
      print "\e[32m[-]\e[0m \e[34mCity name:\e[0m    ", @details.city
      puts
      print "\e[32m[-]\e[0m \e[34mTimeZone:\e[0m     ", @details.timezone
      puts
      print "\e[32m[-]\e[0m \e[34mLatitude:\e[0m     ", lat = @details.latitude
      puts
      print "\e[32m[-]\e[0m \e[34mLongitude:\e[0m    ", lon = @details.longitude
      puts
      print "\e[32m[-]\e[0m \e[34mASN:\e[0m     ", @details.org
      puts
      print "\e[32m[-]\e[0m \e[34mGoogle Maps:\e[0m    http://www.google.com/maps/place/#{lat},#{lon}/@#{lat},#{lon},16z"
      puts
    end
    def catche()
      @details.all
    end
end
