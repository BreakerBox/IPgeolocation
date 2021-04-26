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
    resultfile.write("\nRegion:\t")
    resultfile.writr(@details.region)
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
      write << [ :Region, @details.region]
      write << [ :Time_Zone, @details.timezone]
      write << [ :Latitude, @details.latitude]
      write << [ :Longitude, @details.longitude]
      write << [ :ASN, @details.org]
      write << [ :Google_Maps, "http://www.google.com/maps/place/" + @details.latitude + "," + @details.longitude + "/@" + @details.latitude + "," + @details.longitude + ",16z"]
    }
  end
  def exporthtml(filename)
    ipinfo(@ips)
    FileUtils.touch(filename = filename + '.html')
    File.open(filename, 'w') {|create|
    create.write("<html>\n")
    create.write("<head><title><h2>IP Address information</h2></title></head>")
    create.write("\n<body>")
    create.write("\n<p>IP: " + @details.ip + "</p>")
    create.write("\n<p>Target: " + @details.ip_address.to_s + "</p>")
    create.write("\n<p>Country: " + @details.country_name + "</p>")
    create.write("\n<p>Country Name: " + @details.country + "</p>")
    create.write("\n<p>City Name: " + @details.city + "</p>")
    create.write("\n<p>Time Zone: " + @details.timezone + "</p>")
    create.write("\n<p>Region: " + @details.region + "</p>")
    create.write("\n<p>Latitude: " + @details.latitude + "</p>")
    create.write("\n<p>Longitude: " + @details.longitude + "</p>")
    create.write("\n<p>Organization: " + @details.org + "</p>")
    create.write("\n<p>Google Maps: http://www.google.com/maps/place/" + @details.latitude + "," + @details.longitude + "/@" + @details.latitude + "," + @details.longitude + ",16z</p>")
    create.write("\n</body>")
    create.write("\n</html>")
    }
  end
end
