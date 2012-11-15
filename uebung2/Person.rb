class Person
	
	def initialize(args)
		for i in args.keys
			@i = "#{args[i]}"
			puts i
			puts @i
			puts
			#attr_accessor :i			#weiss nicht, wie ich Getter und Setter setzen soll ):
		end
	end
end

p = Person.new(name: "hansel", vorname: "lutz", hobbies: "bier trinken")
puts p
#puts p.name



puts 
puts 






# hier noch eine etwas andere generische Art, die ich im Netz gefunden habe, 
# bei der man aber die ganze Klasse dann nachtraeglich definiert

class Struct
  def self.hash_initialized *params
    klass = Class.new(self.new(*params))

    klass.class_eval do
      define_method(:initialize) do |h|
        super(*h.values_at(*params))
      end
    end
    klass
  end
end

Person1 = Struct.hash_initialized :derName, :diehobbies

person1 = Person1.new(derName: "Barbara", diehobbies: "GeoCaching, Stunt Kites, Go, Bicycles")
puts "Person1 : " + person1.derName
puts person1.diehobbies
puts



Person2 = Struct.hash_initialized :name, :hobbies
person2 = Person2.new(name: "Matthias",hobbies: "GO , Bicycles, Geocaching")
puts "Person2 : " + person2.name
puts person2.hobbies
puts

person3 = Person2.new(name: "Shorty", hobbies: "Stunt Kites, Go")
puts "Person3 : " + person3.name
puts person3.hobbies
puts

person4 = Person2.new(name: "Ruth",hobbies: "Geocaching")
puts "Person4 : " + person4.name
puts person4.hobbies
puts

person5 = Person2.new(name: "Rolf")
puts "Person5 : " + person5.name
puts person5.hobbies
puts

puts





