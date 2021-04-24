#!/bin/env ruby
require 'open3'
require 'ruby_figlet'
require 'paint'
require 'fileutils'
load '.IPinfo/__main__.rb'
using RubyFiglet
ID = IPinformation.new
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

 \e[1;32m  -h\e[1;30m,\e[1;32m --help\e[0m            command to view help parameters
 \e[1;32m  -m\e[1;30m,\e[1;32m --myip\e[0m            Scan my ip online
 \e[1;32m  -t\e[1;30m,\e[1;32m --target\e[0m          IP address to scan online
 \e[1;32m  -db\e[1;30m,\e[1;32m --database\e[0m       use geoip database to scan ip address
    "
  end
  def trab()
    @param = ARGV[0]
    if (@param == '-m') || (@param == '--myip')
       @ips, err, ups = Open3.capture3("curl ifconfig.co")
       @ips.chomp!
       ID.ipinfo(@ips)
       ID.puts_ip_info()
    elsif (@param == '-t') || (@param == '--target')
        @ips = ARGV[1]
        ID.ipinfo(@ips)
        ID.puts_ip_info()
    elsif (@param == '-h') || (@param == '--help')
      help()
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
      output = ID.catche()
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
Main.cache()
