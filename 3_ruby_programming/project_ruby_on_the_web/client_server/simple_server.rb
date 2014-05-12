require 'socket'
require 'json'

server = TCPServer.open(2000)

loop {
  client = server.accept

  request = client.gets.chomp
  puts request # WHY IS THE SERVER NOT GETTING THE ENTIRE REQUEST?
  header, body = request.split("\r\n\r\n", 2)
  method, path, version = header.split(" ", 3)

  case method
  when 'GET'
    if path =~ /\/index.html/
      client.puts("#{version} 200 OK\r\n\r\n")
      response = File.read(".index.html")
      client.puts("Response size: #{response.size}")
      client.puts(response)
    else
      client.puts("#{version} 404 File not Found\r\n\r\n")
    end
  when 'POST'
    params = JSON.parse(body)
    user_data = "<li>Name: #{params[:viking][:name]}</li><li>Email: #{params[:viking][:name]}</li>"
    response = File.read("./thanks.html").gsub("<% yield %>", user_data)
    # puts response
    client.puts("#{version} 200 OK\r\n\r\n")
    client.puts("Response size: #{response.size}")
    client.puts(response)
  end
  client.puts(Time.now.ctime)
  client.puts("Closing connection. Bye!")
  client.close
}