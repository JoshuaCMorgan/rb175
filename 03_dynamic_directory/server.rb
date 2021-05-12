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

