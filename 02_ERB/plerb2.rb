require 'erb'
# %A This uses `%`, which is a directive (), A is a modifier, telling Ruby to give us the full day.
weekday = Time.now.strftime('%A')
simple_template = "Today is <%= weekday %>."

renderer = ERB.new(simple_template)
puts output = renderer.result()