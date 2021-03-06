require "socket"

server = TCPServer.new("localhost", 3003)

def parse_request(request_line)
  http_method, path_and_param, http = request_line.split(" ")
  path, params = path_and_param.split("?")
  
  params = params.split("&").each_with_object({}) do |pair, hash|
    key, value = pair.split("=")
    hash[key] = value
  end
  [http_method, path, params]
end

loop do
  client = server.accept

  request_line = client.gets
  puts request_line
  next if !request_line || request_line =~ /favicon/

  http_method, path, params = parse_request(request_line)
  
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts "<html>"
  client.puts "<body>"
  #pre tag tells browswer to print directly to the user without modifications, preserving whitespace.
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  rolls = params["rolls"].to_i
  sides = params["sides"].to_i

  client.puts("<h1>Rolls!</h1>")
  rolls.times do 
    roll = rand(sides) + 1
    client.puts("<p>", roll, "</p>")
  end

  client.puts "</body>"
  client.puts "</html>"

  client.close
end