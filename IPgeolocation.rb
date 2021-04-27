#!/bin/env ruby
require 'open3'
require 'ruby_figlet'
require 'paint'
require 'fileutils'
require 'ipaddr'
require 'resolv'
load '.IPinfo/__main__.rb'
load '.IPinfo/FileExport.rb'
using RubyFiglet
ID = IPinformation.new
FileExport = ExportFileInfo.new
class MainInformation
  def initialize(tools, author, github, gmail, verbose = false) #verbose :default => false
    @tools = tools
    @author = author
    @github = github
    @gmail = gmail
    @verbose = false
  end
  def banner(font)
    puts "\e[31m"
    puts '  IP  info'.art font
    puts "                                                  𝖛0.1\e[0m\n"
  end
  def baner()
    puts 
    puts "#{Paint["IPgeolocation v0.1", :magenta, :underline]} "
    puts "
\e[35mInfo:\e[0m This is the official Ruby client library for the IPinfo.io
\e[35mTool:\e[0m This script is an ip geolocation tool programmed in ruby.
\e[35mGithub:\e[0m https://github.com/BreakerBox/
"
  end
  def help()
    banner('Bloody')
    puts " \e[35;4mParametros:\e[0m

 \e[1;32m  -h\e[1;30m,\e[1;32m --help\e[0m            Command to view help parameters
 \e[1;32m  -m\e[1;30m,\e[1;32m --myip\e[0m            Scan my ip online
 \e[1;32m  -t\e[1;30m,\e[1;32m --target\e[0m          IP address to scan online
 \e[1;32m  -db\e[1;30m,\e[1;32m --database\e[0m       Use geoip database to scan ip address
 \e[1;32m  -g\e[1;30m,\e[1;32m --google\e[0m          Open the URL of the scan result online
 \e[1;32m  -e\e[1;30m,\e[1;32m -e-txt\e[0m            Save the online scan result to a .txt file
     \e[1;32m -e-csv\e[0m             Save the file in .csv
     \e[1;32m -e-html\e[0m            Save the file in .html

 \e[1;32m  -v\e[1;30m,\e[1;32m --verbose\e[0m         Enable verbose output

 \e[1;32m  -c\e[1;30m,\e[1;32m --clear\e[0m           Clear cache of scans to ip addresses
    "
  end
  def savemyip()
    if (@param1 == '-e') || (@param1 == '-e-txt')
      @param2 = ARGV[2]
      FileExport.exporttxt(@param2)
    elsif (@param1 == '-e-csv')
      @param2 = ARGV[2]
      FileExport.exportcsv(@param2)
    elsif (@param1 == '-e-html')
      @param2 = ARGV[2]
      FileExport.exporthtml(@param2)
    else
      banner('Bloody')
      ID.puts_ip_info()
    end
  end
  def saveip()
    if (@param2 == '-e') || (@param2 == '-e-txt')
      @param3 = ARGV[3]
      FileExport.exporttxt(@param3)
    elsif (@param2 == '-e-csv')
      @param3 = ARGV[3]
      FileExport.exportcsv(@param3)
    elsif (@param2 == '-e-html')
      @param3 = ARGV[3]
      FileExport.exporthtml(@param3)
    else
      banner('Bloody')
      ID.puts_ip_info()
    end
  end
  def internet_connection?
    begin
      dns_resolver = Resolv::DNS.new()
      dns_resolver.getaddress("google.com")
    rescue
      puts "\n\e[1;30;4m[\e[31m✘\e[1;30m]\e[31m Check your internet connection...\e[0m"
      exit(1)
    end
  end
  def trab()
    @param = ARGV[0]
    $param = @param
    if (@param == '-m') || (@param == '--myip')
       internet_connection?
       @ips, err, ups = Open3.capture3("curl ifconfig.co")
       @ips.chomp!
       @param1 = ARGV[1]
       if (@param1 == "-v") || (@param1 == "--verbose")
        ID.ipinfo(@ips, @verbose = true)
       else
        ID.ipinfo(@ips, @verbose)
       end
       savemyip()
       if (@param1 == "-g") || (@param1 == "--google")
        puts
          ID.open_google_maps()
        else
          return false
        end
      elsif (@param == '-t') || (@param == '--target')
        begin 
          @ips = IPAddr.new ARGV[1]
        rescue
          puts "\n\e[1;30;4m[\e[31m✘\e[1;30m]\e[31m the ip address that you entered is not valid...\e[0m" 
          exit(1)
        end
        @ips = @ips.to_s
        internet_connection?
        @param2 = ARGV[2]
        if (@param2 == "-v") || (@param2 == "--verbose")
        ID.ipinfo(@ips, @verbose = true)
        else
          ID.ipinfo(@ips, @verbose)
        end
        #ID.puts_ip_info()
        saveip #if @param2.include?('-e')
        if (@param2 == "-g") || (@param2 == "--google")
        puts 
          ID.open_google_maps()
        else
          return false
        end
    elsif (@param == '-h') || (@param == '--help')
      help()
    elsif (@param == '-db') || (@param == '--database')
      puts "En proceso..."
    elsif (@param == '-c') || (@param == '--clear')
    FileUtils.rm_rf('cache')
    elsif (@param.nil?)
      puts "#{Paint["lack of arguments", :red]}, #{Paint["use --help", :green]}"
    else
      puts "
\e[1;31m[✘] argument not found\e[0m
\e[1;30mparameter error:\e[0m \e[31;4m#{@param}\e[0m
\e[1;30mset the\e[0m \e[32;4m--help\e[0m \e[1;30mparameter to view the help commands.\e[0m
        "
    end
  end
end
Main = MainInformation.new('IPgeolocation', 'Breaker', 'https://github.com/BreakerBox', 'breakerbox@gmail.com')
Main.trab()
$param != "-m" #|| $param == "--myip" || $param == "-t" || $param == "--target"

def cache()
  output = ID.cache()
  var = File.exists?('./cache')
  if var == false
  FileUtils.mkdir_p('cache')
  end
  #Dir.chdir('cache')
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

cache() if $param == "-m" || $param == "--myip" || $param == "-t" || $param == "--target"
