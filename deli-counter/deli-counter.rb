# Author: Manuel Neuhauser
# Date : 9/30/2013
# Email: manuel.neuhauser@flatironschool.com


katz_deli = []

def take_a_number(line, person)
  line << person
  puts line.length
end

def line(line)
  print "The line is currently: "
  line.each_with_index do |person, index|
    print "#{index+1}. #{person} "
  end
  print "\n"
end

def now_serving(line)
  puts "Currently serving #{line.shift}"
end



take_a_number(katz_deli, "Ada") #=> "1"
take_a_number(katz_deli, "Grace") #=> "2"
take_a_number(katz_deli, "Kent") #=> "3"

line(katz_deli) #=> "The line is currently: 1. Ada 2. Grace 3. Kent"

now_serving(katz_deli) #=> "Currently serving Ada"

line(katz_deli) #=> "The line is currently: 1. Grace 2. Kent"

take_a_number(katz_deli, "Matz") #=> "3"

line(katz_deli) #=> "The line is currently: 1. Grace 2. Kent 3. Matz"

now_serving(katz_deli) #=> "Currently serving Grace"

line(katz_deli) #=> "1. Kent 2. Matz"