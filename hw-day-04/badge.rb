# Author: Manuel Neuhauser
# Date :  9/26/2013
# Email:  manuel.neuhauser@flatironschool.com

# ======================================
#         Badges & Schedules
# ======================================

speakers = [
  "Edsger",
  "Ada",
  "Charles",
  "Alan",
  "Grace",
  "Linus",
  "Matz"
]


def badge(names)
  names.map do |name|
    "Hello, my name is #{name}."
  end
end


def schedule(names)
  room = 0

  names.map do |name|
    "Hello, #{name}! " +
    "You'll be assigned to room #{room +=1 }!"
  end
end


def print(list)
  list.each do |item|
    puts item
  end
end


print badge(speakers)
print schedule(speakers)
