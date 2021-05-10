# hello_world.rb

class HelloWorld
  def call(env)
    output = ""
    env.keys.each {|key| output += "<li>#{key}=#{env[key]}</li>"}
    ['200', {'Content-Type' => 'text/html'}, [output] ]
  end
end

