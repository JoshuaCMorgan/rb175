require 'erb'

template_file = File.read('plerb3.erb')
erb = ERB.new(template_file)
erb.result
# Returns
# "\n\n<html>\n  <body>\n    <h4>Hello, my name is jill</h4>\n  </body>\n</html>\n"