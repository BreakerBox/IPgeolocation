require 'fileutils'
require 'csv'
load '.IPinfo/__main__.rb'
class ExportFileInfo < IPinformation
#  def initialize(name = "Breaker")
#    __author__ = name
#  end
  def exporttxt(filename)
    ipinfo(@ips)
    FileUtils.touch(filename = filename + '.txt')
    resultfile = File.open(filename, mode: 'w')
    resultfile.write("IP:\t")
    resultfile.write(@details.ip_address)
    resultfile.write("\nTarget:\t")
    resultfile.write(@details.ip)
    resultfile.write("\nCountry:\t")
    resultfile.write(@details.country_name)
    resultfile.write("\nCountry Name:\t")
    resultfile.write(@details.country)
    resultfile.write("\nCity Name:\t")
    resultfile.write(@details.city)
    resultfile.write("\nTime Zone:\t")
    resultfile.write(@details.timezone)
    resultfile.write("\nLatitude:\t")
    resultfile.write(@details.latitude)
    resultfile.write("\nLongitude:\t")
    resultfile.write(@details.longitude)
    resultfile.write("\nASN:\t")
    resultfile.write(@details.org)
    resultfile.write("\nGoogle Maps:\t")
    resultfile.write("http://www.google.com/maps/place/#{@details.latitude},#{@details.longitude}/@#{@details.latitude},#{@details.longitude},16z")
    resultfile.write("\n")
    resultfile.close()
  end
  def exportcsv(filename)
    ipinfo(@ips)
    FileUtils.touch(filename = filename + '.csv')
    CSV.open(filename, 'w') { |write|
      write << [ :IP, @details.ip ]
      write << [ :Target, @details.ip_address ]
      write << [ :Country, @details.country_name]
      write << [ :Country_Name, @details.country]
      write << [ :City_Name, @details.city]
      write << [ :Time_Zone, @details.timezone]
      write << [ :Latitude, @details.latitude]
      write << [ :Longitude, @details.longitude]
      write << [ :ASN, @details.org]
      write << [ :Google_Maps, "http://www.google.com/maps/place/" + @details.latitude + "," + @details.longitude + "/@" + @details.latitude + "," + @details.longitude + ",16z"]
    }
  end
end
