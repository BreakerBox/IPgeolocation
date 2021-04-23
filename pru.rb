require 'open3' 
require 'ipinfo'
stdout, stdeerr, status = Open3.capture3("curl ifconfig.co") 
puts stdout.chomp
require 'httpclient'
access_token = '91e04a23db492c'
handler = IPinfo::create(access_token, {:http_client => HTTPClient})
ip_address = stdout
details = handler.details(ip_address)
puts details.all
