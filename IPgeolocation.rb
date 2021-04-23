#!/bin/env ruby
require 'open3'
require 'ruby_figlet'
require 'paint'
using RubyFiglet
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
       ips, err, ups = Open3.capture3("curl ifconfig.co")
       ips.chomp!
       load '.IPinfo/__main__.rb'
       ID.ipinfo(ips)
    elsif (@param == '-t') || (@param == '--target')
        @ips = ARGV[1]
        load '.IPinfo/__main__.rb'
        ID.ipinfo(@ips)
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
  end
end

Main = MainInformation.new('IPgeolocation', 'Breaker', 'https://github.com/BreakerBox', 'breakerbox@gmail.com')
Main.trab()
