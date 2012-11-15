#   Terminal:
#   irb                      # interaktive Ruby-Shell
#   irb --simple-prompt      # ohne Nummerierung der Eingabezeilen
#   exit                     # beendet irb
#   ruby <dateiname.rb>      # Ruby-Datei ausfuehren
#   rails new <appname>      # neues Rails-Projekt
#   rails generate scaffold <modelname> <attributname1>:<datentyp1> usw... # anlegen von Modulen mit MVC
#   rake db:migrate          # SQLite Datenbank anlegen
#   rails server             # unter localhost:3000 im Browser aufrufbar


#	rein objektorientiert, interpretierte Skriptsprache
#	alle Daten sind Objekte und haben einen Rückgabewert

#	Code-Blöcke entweder zwischen { } oder do ... end

puts 5.class
puts "text".class
puts 3.89.class

puts "a,b,c " * 3     # Text wird 3mal ausgegeben
puts "3"+"7"
puts 3**2			  # 3 hoch 2
puts Math.sqrt(9.7)   # Wurzel 9.7
puts



#   Variablen:
puts "Beispiel Variablen"

jetzt = Time.now
puts "Es ist jetzt #{jetzt}."

puts "Wie heisst du?"
name = gets
name.chomp!
puts "Hallo #{name}!"
puts


#   Fallunterscheidung
puts "Beispiel Fallunterscheidung"

zahl = 12
if zahl == 12
	puts "Zahl ist #{zahl}"
else
	puts "Zahl ist nicht #{zahl}"
end
# oder
if zahl == 12 then puts "Zahl ist #{zahl}" ; end

#switch
puts "Gib ein ganze Zahl ein!"
eingabe = gets.to_i				#.to_f für float

case eingabe
when 1
	puts "die Eingabe war #{eingabe}"
when 2,3
	puts "die Eingabe war nicht 1."
else
	puts "die Eingabe war nicht 1,2 oder 3, sondern #{eingabe}"
end

#   Schleifen
#while-Schleife
wahl = ""
while wahl != "n"
	print "1.Moechten Sie nochmal? j/n : "
	wahl = gets.chomp.downcase
end
#oder
wahl = ""
until wahl == "n"
	print "2.Moechten Sie nochmal? j/n : "
	wahl = gets.chomp.downcase
end

#Endlosschleife
wahl = ""
zaehler = 1
loop do
 	puts "#{zaehler}"
 	zaehler=zaehler+1
 	print "Endlos.Moechten Sie nochmal? j/n : "
 	wahl = gets.chomp.downcase
 	break if wahl == "n"
end

#for-Schleife
for i in 1..5
	puts "#{i}.Mal"
end

puts


#   Hashes
puts "Beispiel Hashes"

endungen = {
	"de" => "Deutschland",
	"at" => "Oesterreich",
	"ch" => "Schweiz"
}

for i in endungen.keys
	puts "Die Endung #{i} gehoert zu #{endungen[i]}."
end
puts



#   Arrays
puts "Beispiel Arrays"

# 1. Mit der Methode Array.new(Anzahl, Objekt)
array1 = Array.new(7, "text")
array1[0] = "text0"
# 2. 
array2 = ["null","eins","zwei"]
# 3. beliebige Objekte
array3 = [3, 5.5, "text"]

for i in 0..2
	puts "#{array3[i]}"
end

#oder
for e in array3
	puts "#{e}"
end
#Arraylaenge
puts "Die Laenge des Arrays betraegt " + array3.length.to_s

#Ruby kennt eine Kurzschreibweise, um ein Array mit Zeichenketten 
#aufzubauen:

array4 = %w[Birne Apfel Banane]
puts array4

puts


#   Methoden
puts "Beispiel Methoden"

def ausgabe(text)
	puts "#{text}"
end

ausgabe("Methode: ausgabe: Hallo Konsole...")

#Methoden, die true oder false zurückliefern, 
#besitzen ein Fragezeichen am Ende
if "".empty? == true
	puts "true"
else
	puts "false"
end
puts





#   Klassen in Ruby: keine abgeschlossenen Gebilde, kann zu jeder
#   Zeit noch Methoden hinzugefuegt werden
#   Schluesselwoerter fuer Methoden: public, private, protected
#   Klassendefinition: 
puts "Beispiel Klasse"

class Person
	#Klassenvariable
	@@counter = 0
	#initialize kann nur einmal definiert werden, sollen untersch. viele Parameter uebergeben werden, 
	#dann sind die optionalen Parameter mit einem Defaultwert zu belegen
	def initialize(vorname, nachname, geschlecht = "nicht bekannt")	
		#KLassenvariablen
		@vorname  = vorname
		@nachname = nachname
		@geschlecht = geschlecht
	end
	attr_reader :vorname, :nachname		#getter
	attr_writer :vorname, :nachname		#setter
	#oder beides in einem: attr_accessor :vorname, :nachname

	def ausgabeName
		#will man die Instanzvariable neu setzen (setter), dann nur so:
		self.vorname = "Katja"
		@vorname + " " + @nachname
	end
	#Klassenmethode
	def self.zaehlen
		puts "Hier wird gezaehlt"
	end
end

person1 = Person.new("rowena","wodrich")
puts person1.ausgabeName
Person::zaehlen				#Zugriff auf Klassenmethode
person1.vorname = "herbert"
person1.nachname = "simpson"
puts person1.ausgabeName

puts

# => Symbole:

# es gibt fuer ein Symbol nur genau eine Instanz, zb. als Schluessel in einer Hash
# oder bei der Angabe von Namen



# => Code-Bloecke:
#Code-Stücke, die man mit Methoden-Aufrufen verbinden kann, grad so als wärens Parameter. 
#Das ist eine unbeschreiblich mächtige Sache. Man kann Code-Blöcke benutzen, um Callbacks zu 
#implementieren (die sind aber einfacher als die anonymen inneren Klassen von Java), 
#um Code-Stücke durch die Gegend zu schicken (das geht aber flexibler als mit Fnktions-Pointern in C) 
#und um Iteratoren zu implementieren. 

#Wenn man jetzt so einen Block hat, kann man ihn mit einem Aufruf an eine Methode binden. 
#Diese Methode kann dann den Block einmal oder mehrmals aufrufen, wobei sie die yield-Anweisung 
#von Ruby benutzt.

#Beispiel:
puts "Beispiel Block"

def callBlock
  yield
  yield
end

callBlock { puts "In the block" }

#Code-Blöcke werden in der Ruby-Bibliothek benutzt, um Iteratoren zu implementieren:
# Innerhalb der Array-Klasse ist each so implementiert:
#def each
#  for each element
#    yield(element)
#  end
#end
a = %w( ant bee cat dog elk )
a.each { |animal| puts animal }
puts


# => Procs:

#Proc objects are blocks of code that have been bound to a set of local variables. Once bound, 
#the code may be called in different contexts and still access those variables.

#Beispiel:
puts "Beispiel Proc"

def foo (a, b)
    a.call(b)
end

putser = Proc.new {|x| puts x}	#oder Kernel method: putser = lambda {|x| puts x}
foo(putser, 4)

#oder 
etwas = proc { puts "Ich bin ein Proc"}
etwas.call

def run(p)
	puts "About to call a procedure."
	p.call
	puts "there: finished."
end

run etwas
puts
#und noch ein Beispiel:

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

content_definitions = Proc.new {

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