require 'erb'
def random_number
  (0..9).to_a.sample
end

content1 = ERB.new("<html><body><p>The number is: <%= random_number %>!</p></body></html>")
puts content1 # #<ERB:0x00007fe6ad0674f8>
p content1 #<ERB:0x00007fc22191ee80 @src="#coding:UTF-8\n_erbout = +''; _erbout.<< \"<html><body><p>The number is: \".freeze; _erbout.<<(( random_number ).to_s); _erbout.<< \"!</p></body></html>\".freeze; _erbout", @encoding=#<Encoding:UTF-8>, @frozen_string=nil, @filename=nil, @lineno=0, @_init=#<Class:ERB>>
#"<html><body><p>The number is: 3!</p></body></html>"
p content1.result 
# "<html><body><p>The number is: 0!</p></body></html>"

