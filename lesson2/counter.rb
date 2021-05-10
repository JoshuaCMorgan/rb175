# simulating stateful application that keep track of page number
# you can send whatever is necessary for rendering the page by using the URL.
# and by crafting the urls and links (see <a> tags), you can give the impression of a program that is maintaining some state that is holding some values between page refreshes. 
require "socket"

def parse_request(request_line)
  http_method, path_and_param, http = request_line.split(" ")
  path, params = path_and_param.split("?")
  
  params = (params || "").split("&").each_with_object({}) do |pair, hash|
    key, value = pair.split("=")
    hash[key] = value
  end
  [http_method, path, params]
end

server = TCPServer.new("localhost", 3003)
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
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  client.puts("<h1>Counter</h1>")

  number = params["number"].to_i
  client.puts("<p>The current number is #{number}.</p>")

  # make a link to the current page.  But, with parameters added/manipulated
  client.puts("<a href='?number=#{number + 1}'>Add one</a>")
  client.puts("<a href='?number=#{number - 1}'>Subtract one</a>")
  client.puts "</body>"
  client.puts "</html>"

  client.close
end