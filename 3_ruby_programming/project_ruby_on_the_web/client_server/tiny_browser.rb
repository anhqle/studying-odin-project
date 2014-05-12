require 'socket'
require 'json'

host = 'localhost'
port = 2000

socket = TCPSocket.open(host, port)

puts "Do you want to send a POST or a GET request? (type the verb)"
method = gets.chomp
case method
when "POST"
  printf "Enter your name: "
  name = gets.chomp
  printf "Enter your email: "
  email = gets.chomp
  
  path = "/script.cgi"
  data = {:viking => {:name => name, :email => email} }.to_json
  request = "POST #{path} HTTP/1.0\r\n" + "Content-Length: #{data.size}\r\n\r\n#{data}"
  puts request
when "GET"
  path = "/index.html"
  request = "GET #{path} HTTP/1.0\r\n\r\n"
end

socket.print(request) # Send request (print is sending the request to the server, just like to STDOUT)
response = socket.read # Read complete response
# Can also use socket.readlines, but that gives back array of lines
# socket.gets will give back only the first line
headers, body = response.split("\r\n\r\n", 2)
puts headers
puts body




