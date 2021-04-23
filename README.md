# IPgeolocation
![Paint Version](https://img.shields.io/gem/v/paint)
[`IPgeolocation.com`](https://github.com/BreakerBox/IPgeolocation.git)

This is the official Ruby client library for the [`IPinfo.io`](https://ipinfo.io) IP address API, allowing you to lookup your own IP address, or get any of the following details for an IP:

This script is an ip geolocation tool programmed in ruby ​​by [`BreakerBox`](https://github.com/BreakerBox), I hope you like it.
# Installation

### Required gems
 - [base64](https://github.com/ruby/base64)
 - [ipinfo](https://github.com/ipinfo/ruby)
 - [geoip](https://github.com/cjheath/geoip)
 - [paint](https://github.com/janlelis/paint)
 - [ruby_figlet](https://github.com/Demonstrandum/RubyFiglet)
 - [fileutils](https://gist.github.com/jensendarren/e78b464a5b21e58faa29)

### Installation in termux
```
$ apt update
```
```
$ apt upgrade
```
```
$ apt install git
```
```
$ apt install ruby
```
```
$ git clone https://github.com/BreakerBox/IPgeolocation.git/
```
```
$ cd IPgeolocation
```
```
$ ruby IPgeolocation.rb --help
```
### Installation in others

$ git clone https://github.com/BreakerBox/IPgeolocation.git/

$ cd IPgeolocation

$ ruby requirements.rb

$ ruby IPgeolocation.rb --help

# Usage

    root@breaker:~/home/Pack-Tool# ruby IPgeolocation.rb --help

    ██▓ ██▓███       ██▓ ███▄    █   █████▒ ▒█████
    ▓██▒▓██░  ██▒    ▓██▒ ██ ▀█   █ ▓██   ▒ ▒██▒  ██▒
    ▒██▒▓██░ ██▓▒    ▒██▒▓██  ▀█ ██▒▒████ ░ ▒██░  ██▒
    ░██░▒██▄█▓▒ ▒    ░██░▓██▒  ▐▌██▒░▓█▒  ░ ▒██   ██░
    ░██░▒██▒ ░  ░    ░██░▒██░   ▓██░░▒█░    ░ ████▓▒░
    ░▓  ▒▓▒░ ░  ░    ░▓  ░ ▒░   ▒ ▒  ▒ ░    ░ ▒░▒░▒░
     ▒ ░░▒ ░          ▒ ░░ ░░   ░ ▒░ ░        ░ ▒ ▒░
     ▒ ░░░            ▒ ░   ░   ░ ░  ░ ░    ░ ░ ░ ▒
     ░                ░           ░             ░ ░
                                                  𝖛0.1
    Parametros:

     -h, --help            command to view help parameters
     -t, --target          IP address to scan online
     -db, --database       use geoip database to scan ip address
