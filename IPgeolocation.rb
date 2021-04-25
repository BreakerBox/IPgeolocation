#!/bin/env ruby
require 'open3'
require 'ruby_figlet'
require 'paint'
require 'fileutils'
load '.IPinfo/__main__.rb'
load '.IPinfo/FileExport.rb'
using RubyFiglet
ID = IPinformation.new
FileExport = ExportFileInfo.new
class MainInformation
  def initialize(tools, author, github, gmail)
    @tools = tools
    @author = author
    @github = github
    @gmail = gmail
  end
  def banner(font)
    @font = font
    puts "\e[31m"
    puts '  IP  info'.art @font
    puts "                                                  𝖛0.1\e[0m\n"
  end
  def help()
    banner('Bloody')
    puts " \e[35;4mParametros:\e[0m

 \e[1;32m  -h\e[1;30m,\e[1;32m --help\e[0m            Command to view help parameters
 \e[1;32m  -m\e[1;30m,\e[1;32m --myip\e[0m            Scan my ip online
 \e[1;32m  -t\e[1;30m,\e[1;32m --target\e[0m          IP address to scan online
 \e[1;32m  -db\e[1;30m,\e[1;32m --database\e[0m       Use geoip database to scan ip address
 \e[1;32m  -e\e[1;30m,\e[1;32m -e-txt\e[0m            Save the online scan result to a .txt file
     \e[1;32m -e-csv\e[0m             Save the file in .csv


 \e[1;32m  -c\e[1;30m,\e[1;32m --clear\e[0m           Clear cache of scans to ip addresses
    "
  end
  def savemyip()
    @param1 = ARGV[1]
    if (@param1 == '-e') || (@param1 == '-e-txt')
      @param2 = ARGV[2]
      FileExport.exporttxt(@param2)
    elsif (@param1 == '-e-csv')
      @param2 = ARGV[2]
      FileExport.exportcsv(@param2)
    end
  end
  def saveip()
    @param2 = ARGV[2]
    if (@param2 == '-e') || (@param2 == '-e-txt')
      @param3 = ARGV[3]
      FileExport.exporttxt(@param3)
    elsif (@param2 == '-e-csv')
      @param3 = ARGV[3]
      FileExport.exportcsv(@param3)
    end
  end
  def trab()
    @param = ARGV[0]
    $param = @param
    if (@param == '-m') || (@param == '--myip')
       @ips, err, ups = Open3.capture3("curl ifconfig.co")
       @ips.chomp!
       ID.ipinfo(@ips)
       ID.puts_ip_info()
       savemyip()
      elsif (@param == '-t') || (@param == '--target')
        @ips = ARGV[1]
        ID.ipinfo(@ips)
        ID.puts_ip_info()
        saveip()
    elsif (@param == '-h') || (@param == '--help')
      help()
    elsif (@param == '-db') || (@param == '--database')
      puts "En proceso..."
    elsif (@param == '-c') || (@param == '--clear')
    FileUtils.rm_rf('cache')
    elsif (@param.nil?)
      puts "
#{Paint["lack of arguments", :red]}, #{Paint["use --help", :green]}
      "
    else
      puts "
\e[1;31m[✘] argument not found\e[0m
\e[1;30mparameter error:\e[0m \e[31;4m#{@param}\e[0m
\e[1;30mset the\e[0m \e[32;4m--help\e[0m \e[1;30mparameter to view the help commands.\e[0m
        "
    end
    def cache()
      output = ID.cache()
      var = File.exists?('./cache')
      if var == false
      FileUtils.mkdir_p('cache')
      end
#     Dir.chdir('cache')
      pathcache = './cache/cache_ipinfo.log'
      var2 = File.exists?(pathcache)
      if var2 == false
      FileUtils.touch(pathcache)
      filen = File.open(pathcache, 'w')
      filen.write("\n")
      filen.close()
      end
      lines = IO.readlines(pathcache).map { |line|
      "#{output}" + "#{line}"
      }
      File.open(pathcache, 'w') { |file|
      file.puts lines
      }
    end
  end
end


Main = MainInformation.new('IPgeolocation', 'Breaker', 'https://github.com/BreakerBox', 'breakerbox@gmail.com')
Main.trab()
Main.cache() if $param == "-m" || $param == "--myip" || $param == "-t" || $param == "--target"
