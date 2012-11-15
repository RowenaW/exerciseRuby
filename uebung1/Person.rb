class Person
	attr_accessor :name, :hobbies

	def initialize (name, hobbies)
		@name    = name
		#string.split(",") : durch komma getrennte Hobbies 
		#werden als Array gespeichert
		@hobbies = hobbies.split(", ")	
		for e in @hobbies
				e.chomp!(" ")	#wenn am Ende des Wortes noch ein Leerzeichen, wird abgetrennt
		end
	end

	def match_hobbies(person2)
		rueckgabe = Array.new
		hob = person2.hobbies
		z = 0
		for e in hob
			for i in hobbies
			    if e.downcase == i.downcase		#woerter kleingeschrieben
			    	rueckgabe[z] = i
			    	z = z + 1
				end
			end
		end
		rueckgabe
	end

	def matches()
		gefunden = Hash.new
	    ObjectSpace.each_object(Person) { |o|
	    	if o.name != self.name
	    		gefunden[:name => o.name] = { 		
	    			:anzahl => match_hobbies(o).length, 
	    			:hobbies => match_hobbies(o) 
	    		}
	    	end
	    }
	    # sortierter hash wird in array gespeichert
	    # - bedeutet descendent sort, bei ascendent einfach weglassen
	    a = gefunden.sort_by { |namen, gleichehobbies| -gleichehobbies[:anzahl] }	
	    a
  	end

end

person1 = Person.new("Barbara", "GeoCaching, Stunt Kites, Go, Bicycles")
puts "Person1 : " + person1.name
puts person1.hobbies
puts

person2 = Person.new("Matthias", "GO , Bicycles, Geocaching")
puts "Person2 : " + person2.name
puts person2.hobbies
puts

person3 = Person.new("Shorty", "Stunt Kites, Go")
puts "Person3 : " + person3.name
puts person3.hobbies
puts

person4 = Person.new("Ruth","Geocaching")
puts "Person4 : " + person4.name
puts person4.hobbies
puts

puts "gemeinsame hobbies von Person1 und Person2:"
m2 = person1.match_hobbies(person2)
puts m2

puts

puts "Alle Personen mit gleichen Hobbies wie Barbara nach Anzahl der Hobbies absteigend sortiert: "
m = person1.matches
puts m.inspect

