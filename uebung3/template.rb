def template
  template =<<DELIM
<html>
<head>
#{yield :head}
</head>
<body>
#{yield}
<hr>
<p>
#{yield :footer}
</p>
</body>
</html>
DELIM
  return template
end 

content_definitions = proc {

	|i|

	case "#{i}"
	when "head"
		"ich bin ein head"
	when "footer"
		"ich bin ein footer"
	else
		"und sonst"
	end
}

puts template &content_definitions

puts
# procs are closures!
# that is, they preserve the variable bindings from the place where they are defined.

#extend create_counter such that it returns two procs, one for increasing, one for decreasing the counter.
def create_counter
  n = 0
  array = Array.new
  array[0] = proc { n+=1 }
  array[1] = proc { n-=1 }
  return array
end

first_counter = create_counter
puts "first_counter_erhoeht #{first_counter[0].call}"
puts "first_counter_erhoeht #{first_counter[0].call}"
puts "first_counter_verringert #{first_counter[1].call}"

second_counter = create_counter
puts "second_counter_verringert #{second_counter[1].call}"
puts "first_counter_erhoeht #{first_counter[0].call}"
puts "second_counter_erhoeht #{second_counter[0].call}"
puts "first_counter_verringert #{first_counter[1].call}"
