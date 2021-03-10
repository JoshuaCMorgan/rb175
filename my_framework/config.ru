# config.ru

require_relative 'hello_world'

# Rack method `run` to say what application we want to run on our server
run HelloWorld.new