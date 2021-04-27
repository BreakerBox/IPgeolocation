require 'launchy'
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
    put = decode_token('OTFlMDRhMjNkYjQ5MmMK')
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
    var_google()
  end
  def var_google()
   begin
   @google_maps = "http://www.google.com/maps/place/" + @details.latitude + "," + @details.longitude + "/@" + @details.latitude + "," + @details.longitude + ",16z"
   rescue
   return false
   end
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
      print "\e[32m[-]\e[0m \e[35mLatitude:\e[0m     ", @details.latitude
      rescue
      print "\e[32m[-]\e[0m \e[35mLatitude:\e[0m —"
      end
      puts
      begin
      print "\e[32m[-]\e[0m \e[35mLongitude:\e[0m   ", @details.longitude
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
      print "\e[32m[-]\e[0m \e[35mGoogle Maps:\e[0m ", @google_maps if (@details.longitude.to_f.class == Float) || (@details.latitude.to_f.class == Float)
      rescue
      print "\e[32m[-]\e[0m \e[35mGoogle Maps:\e[0m —"
      end
      puts
    end
    def open_google_maps()
      begin
        Launchy.open(@google_maps)
      rescue
        puts "\n\e[1;30m[\e[31m✘\e[1;30m]\e[31m Error opening web browser..."
      end
    end
    def cache()
      @details.all
    end
end
