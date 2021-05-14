require "yaml"

require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do 
  @users = YAML.load_file("users.yaml")
end

get "/" do
  redirect to("/home")
end

get "/users" do
  erb(:users)
end

get "/home/:name" do
  erb(params[:name].to_sym, {locals: params})
end
