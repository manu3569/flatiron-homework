# Author: Manuel Neuhauser
# Date :  9/26/2013
# Email:  manuel.neuhauser@flatironschool.com

# ======================================
#                Vowels
# ======================================



# 1. Use 'if' and 'elsif':

def vowels_1(letter)
  letter = letter.downcase
  if letter    == "a"
    true
  elsif letter == "e"
    true
  elsif letter == "i"
    true
  elsif letter == "o"
    true
  elsif letter == "u"
    true
  else
    false
  end
end

p vowels_1('A') #=> true
p vowels_1('u') #=> true
p vowels_1('S') #=> false
p vowels_1('t') #=> false


# 2. Use 'case':

def vowels_2(letter)
  case letter.downcase
    when "a" then true
    when "e" then true
    when "i" then true
    when "o" then true
    when "u" then true
    else false
  end
end

p vowels_2('A') #=> true
p vowels_2('u') #=> true
p vowels_2('S') #=> false
p vowels_2('t') #=> false


# 3. Use 'if' and no 'else' on a single line:

def vowels_3(letter)
  letter = letter.downcase
  return true if letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u"
  false
end

p vowels_3('A') #=> true
p vowels_3('u') #=> true
p vowels_3('S') #=> false
p vowels_3('t') #=> false


# 4. Don't use 'if' or 'case' while on a single line:

def vowels_4(letter)
  letter = letter.downcase
  letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u"
end

p vowels_4('A') #=> true
p vowels_4('u') #=> true
p vowels_4('S') #=> false
p vowels_4('t') #=> false


# 5. Use 'if' and no 'else' on a single line:

def vowels_5(letter)
  letter.downcase.match(/a|e|i|o|u/) != nil
end

p vowels_5('A') #=> true
p vowels_5('u') #=> true
p vowels_5('S') #=> false
p vowels_5('t') #=> false


# 6. Return first vowel in string

def vowels_6(words)
  words.downcase.match(/a|e|i|o|u/).to_s
end

p vowels_6("This is a long sentence.") #=> "i"
p vowels_6("Here we go again.")        #=> "e"
p vowels_6("Psssst.")                  #=> ""


# 7. Return index of first vowel in string

def vowels_7(words)
  offset = nil
  index = 0
  words.each_char do |char|
    if char == "a" || char == "e" || char == "i" || char == "o" || char == "u"
      offset ||= index
    end 
    index +=1
  end
  offset
end

p vowels_7("This is a long sentence.") #=> 2
p vowels_7("Here we go again.")        #=> 1
p vowels_7("Psssst.")                  #=> nil

