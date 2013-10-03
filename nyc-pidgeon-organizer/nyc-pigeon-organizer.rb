require 'awesome_print'
########################
# NYC PIGEON ORGANIZER #
########################

# Start with the following collected data on NYC pigeons.

pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms .K"],
    :white => ["Queenie", "Andrew", "Ms .K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms .K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms .K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

my_pigeon_list = {}

pigeon_data.each do |attribute, attribute_hash|
  attribute_hash.each do |attribute_value, pigeon_name_hash|
    pigeon_name_hash.each do |pigeon_name|
      
      my_pigeon_list[pigeon_name] = {} unless my_pigeon_list[pigeon_name]

      if attribute == :color
        (my_pigeon_list[pigeon_name][attribute] ||= []) << attribute_value.to_s
      else
        my_pigeon_list[pigeon_name][attribute] = attribute_value.to_s
      end

    end
  end
end


# Iterate over the hash above collecting each pigeon by name by and rebuild it into the hash below 
# that displays the individual attributes of each bird.

pigeon_list = {
  "Theo" => {
    :color => ["purple", "grey"],
    :gender => "male",
    :lives => "Subway"
  },
  "Peter Jr." => {
    :color => ["purple", "grey"],
    :gender => "male",
    :lives => "Library"
  },
  "Lucky" => {
    :color => ["purple"],
    :gender => "male",
    :lives => "Central Park" # Replaced "City Hall"
  },
  "Ms .K" => {
    :color => ["grey", "white"],
    :gender => "female",
    :lives => "Central Park"
  },
  "Queenie" => {
    :color => ["white", "brown"],
    :gender => "female",
    :lives => "Subway"
  },
  "Andrew" => {
    :color => ["white"],
    :gender => "male",
    :lives => "City Hall" # Replaced "Central Park"
  },
  "Alex" => {
    :color => ["white", "brown"],
    :gender => "male",
    :lives => "Central Park"
  }
}

puts "The generated Hash #{my_pigeon_list.eql?(pigeon_list) ? "matches" : "doesn't match" } the given Hash:\n\n"


#puts my_pigeon_list
ap my_pigeon_list

