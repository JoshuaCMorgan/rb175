# W pass the current binding to ERB#result, which evaluates the ERB tags in the template and returns a string with the variables filled in.
require 'erb'

x = 1

def y
  2
end

template = ERB.new("x is <%= x %>, y() returns <%= y %>, self is `<%= self %>`")
template.result(binding) 
# => "x is 1, y() returns 2, self is `main`"