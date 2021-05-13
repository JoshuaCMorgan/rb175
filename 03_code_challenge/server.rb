require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get '/' do
  @files = Dir.glob("*", base: "public").sort
  # @files = Dir.glob("public/*").map {|file| File.basename(file) }.sort
  @param = params['sort']
  @files.reverse! if @param == 'descending'

  erb(:index)
end

# Sinantra allows for routes to utilize query parameters.
# So, you can think of this route "/" as a default with the ability to expand. As a result, you can do what we did on line 8.  You can extract those parameters.