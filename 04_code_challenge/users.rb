require "yaml"

require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"




users = YAML.load_file("users.yaml")

