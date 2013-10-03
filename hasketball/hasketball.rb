# Author: Manuel Neuhauser
# Date : 9/30/2013
# Email: manuel.neuhauser@flatironschool.com
 

# Hashketball Nests
#
# Great news! You're going to an NBA game! The only catch is that you've been
# volunteered to keep stats at the game.
#
# Using Nested Hashes, define a game, with two teams, their players, and the players stats:
#
# The game has two teams.
#

game_data = [
  { 
    team_name: "LA Lakers", 
    colors: [:yellow, :purple],
    players: [
      { name: "Shaq O'neal", number: 34, shoe_size: 13, 
        stats: { points: 59, rebounds: 37, assists: 3, 
          steals: 59, blocks: 23, slam_dunks: 99 } 
      },
      { name: "Kobe Bryant", number: 8, shoe_size: 11.5, 
        stats: { points: 23, rebounds: 28, assists: 3, 
          steals: 25, blocks: 23, slam_dunks: 20 } 
      },
      { name: "Steve Blake", number: 5, shoe_size: 11, 
        stats: { points: 18, rebounds: 29, assists: 3, 
          steals: 27, blocks: 23, slam_dunks: 11 } 
      },
      { name: "Pau Gasol", number: 16, shoe_size: 12, 
        stats: { points: 24, rebounds: 35, assists: 3, 
          steals: 23, blocks: 23, slam_dunks: 32 } 
      },
      { name: "Steve Nash", number: 10, shoe_size: 10, 
        stats: { points: 11, rebounds: 54, assists: 3, 
          steals: 34, blocks: 23, slam_dunks: 42 } 
      }
    ]
  },
  { 
    team_name: "Chicago Bulls", 
    colors: [:red, :black],
    players: [
      { name: "Vladimir Radmanovic", number: 77, shoe_size: 11.5, 
        stats: { points: 21, rebounds: 37, assists: 3, 
          steals: 60, blocks: 23, slam_dunks: 99 } 
      },
      { name: "Jimmy Butler", number: 21, shoe_size: 12.5, 
        stats: { points: 35, rebounds: 28, assists: 3, 
          steals: 21, blocks: 23, slam_dunks: 21 } 
      },
      { name: "Malcolm Thomas", number: 3, shoe_size: 11, 
        stats: { points: 15, rebounds: 29, assists: 3, 
          steals: 15, blocks: 23, slam_dunks: 35 } 
      },
      { name: "Marquis Teague", number: 25, shoe_size: 10, 
        stats: { points: 26, rebounds: 35, assists: 3, 
          steals: 13, blocks: 23, slam_dunks: 24 } 
      },
      { name: "Derrick Rose", number: 1, shoe_size: 9.5, 
        stats: { points: 25, rebounds: 54, assists: 3, 
          steals: 16, blocks: 23, slam_dunks: 16 } 
      }
    ]
  }
]

# A team has:
# - A name
# - Two colors
#
# Each team should have at least 5 players
#
# Each player should have a:
# - name
# - number (like their jersey number)
# - shoe size
#
# Each player should have the following stats:
# - points
# - rebounds
# - assists
# - steals
# - blocks
# - slam dunks
 
# Using the power of Ruby, and the Hashes you created above, answer the following questions:

# Return the number of points scored for any player:
#

def player_points(number, game_data)
  game_data.each do |team|
    team[:players].each do |player|
      return player[:stats][:points] if player[:number] == number
    end
  end
  nil  
end

puts player_points(34, game_data)

 
# Return the shoe size for any player:
#

def player_shoe_size(number, game_data)
  game_data.each do |team|
    team[:players].each do |player|
      return player[:shoe_size] if player[:number] == number
    end
  end
  nil  
end

puts player_shoe_size(34, game_data)


# Return both colors for any team:
#

def team_colors(team_name, game_data)
  game_data.each do |team|
    return team[:colors] if team[:team_name] == team_name
  end
  nil  
end

puts team_colors("LA Lakers", game_data)
 

# Return both teams names:
#

def team_names(game_data)
  game_data.map do |team|
    team[:team_name]
  end
end

puts team_names(game_data)


# Return all the player numbers for a team:
#
 
def players_for(team_name, game_data)
  game_data.each do |team|
    if team[:team_name] == team_name
      return team[:players].map do |player|
        player[:number]
      end
    end
  end
  nil
end 

puts players_for("LA Lakers", game_data)


# Return all the stats for a player:
#

def player_stats(number, game_data)
  game_data.each do |team|
    team[:players].each do |player|
      return player[:stats] if player[:number] == number
    end
  end
  nil  
end

puts player_stats(34, game_data)

 
# Return the rebounds for the player with the largest shoe size
#

def rebounds_for_big_foot(game_data)
  big_foot = { shoe_size: 0 }
  game_data.each do |team|
    team[:players].each do |player|
      if player[:shoe_size] > big_foot[:shoe_size]
        big_foot = player
      end
    end
  end
  big_foot[:stats][:rebounds]  
end

puts rebounds_for_big_foot(game_data)

 
# Bonus Questions: define methods to return the answer to the following questions:
# Which player has the most points?
#

def player_with_highest_points(game_data)
  best_player = { stats: { points: 0 } }
  game_data.each do |team|
    team[:players].each do |player|
      if player[:stats][:points] > best_player[:stats][:points]
        best_player = player
      end
    end
  end
  best_player[:name]  
end

puts player_with_highest_points(game_data)

 
# Which team has the most points?
#
 
def team_with_higheset_points(game_data)
  game_data.map do |team|
    [ team[:team_name],
      team[:players].map do |player|
        player[:stats][:points]
      end.inject(:+)
    ]
  end.sort {|a,b| b[1] - a[1] }[0][0]
end

puts team_with_higheset_points(game_data)


# Which player has the longest name?
#

def player_with_longest_name(game_data)
  game_data.map do |team|
    team[:players].map do |player|
      player[:name]
    end
  end.flatten.sort {|a,b| b.length - a.length }[0]
end

puts player_with_longest_name(game_data)

 
# Super Bonus:
# Write a method that returns true if the player with the longest name had the most steals:
#

def long_named_stealer?(game_data)
  player_with_longest_name(game_data) == game_data.map do |team|
    team[:players].map do |player|
      { player_name: player[:name], 
        steals: player[:stats][:steals] }
    end
  end.flatten.sort {|a,b| b[:steals] - a[:steals]}.shift[:player_name]
end

puts long_named_stealer?(game_data)

