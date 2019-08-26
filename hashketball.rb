require "pry"

def game_hash 
{:home => {
  :team_name =>"Brooklyn Nets",
  :colors => ["Black","White"],
  :players => [ 
    {player_name: 'Alan Anderson', number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
      {player_name: 'Reggie Evans', number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
      {player_name: 'Brook Lopez', number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
      {player_name: 'Mason Plumlee', number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
      {player_name: 'Jason Terry', number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      ] #end of array of hashes of players 
  }, #end of home team hash 
  :away =>
  {:team_name => "Charlotte Hornets",
  :colors => ["Turquoise","Purple"],
  :players => [{player_name: 'Jeff Adrien', number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
      {player_name: 'Bismack Biyombo', number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},
      {player_name: 'DeSagna Diop', number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
      {player_name: 'Ben Gordon', number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0}, 
      {player_name: 'Kemba Walker', number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}
      ] # end of array of hashes of players 
  } #end of away  
} #end of the higher level hash 
end 
# hashes are like objects in javascript
# arrays are the same 

def num_points_scored (player_n)
  game_hash.map do |location, team|
    team[:players].map do |individual_player|
      if player_n == individual_player[:player_name]
        return individual_player[:points] 
      end #if end 
    end #team map end 
  end #game_hash each    
end #method end 
#goal of this method is to take in the players name and return the
#number of points scored for that specific player 

def shoe_size (player_n)
  game_hash.map do |location, team|
    team[:players].map do |individual_player|
      if player_n == individual_player[:player_name]
        return individual_player[:shoe]
      end #if end 
    end#team[players] end 
  end #game_hash end   
end #end for method 

def team_colors (team_n)
  game_hash.map do |location, team|
    if team_n == team[:team_name]
      return team[:colors]  
    end #end of if statement   
  end #end of game_hash    
end #end of method 

def team_names
  game_hash.map do |location, team|
    team[:team_name]
    # i removed return as it killed the method after returning the first name 
  end #end of game_hash 
end #end of method 

def player_numbers (team_n)
  game_hash.map do |location, team|
    #team[:players].map do |individual_player| Excess line, return statement iterate through this level as well. 
      if team_n == team[:team_name] #used location instead of team and was receiving type conversion error. 
        return team[:players].map{|individual_player| individual_player[:number] } 
      end #end of if 
    #end #end of team/players 
  end #end of game_hash  
end #end of method  

# #going to try the same method above but in a slightly different way. Code below is trying to find the same solution but a different route 
# def player_numbers (team_n)
#   game_hash.map do |location, team|
#     team[:players].map do |individual_player|
#       if team_n == team[:team_name] #used location instead of team and was receiving type conversion error. 
#         individual_player[:number].to_a
#       end #end of if 
#     end #end of team/players 
#   end #end of game_hash  
# end #end of method  

# # some play code above trying to solve the player_numbers in a different way. 
def player_stats (player_n)
  game_hash.map do |location, team|
    team[:players].map do |individual_player|
      if player_n == individual_player[:player_name]
        return individual_player.delete_if { |stat,value| 
        #binding.pry
        [:player_name].include?(stat)}
       
        ## return value above is saying go to individual player deleting the first section which is 'name' and return remainding information 

      end #end of if statement 
    end #end of team/players   
  end #end  of game_hash 
end  #end of method 

def big_shoe_rebounds
  largest_shoe_size = 0 #baseline 
  most_rebounds = 0
    game_hash.map do |location,team|
      team[:players].map do |individual_player|
        if individual_player[:shoe] > largest_shoe_size
          largest_shoe_size = individual_player[:shoe]
          #eventually the largest shoe size will left 
          most_rebounds = individual_player[:rebounds]
        end #if statment 
      end #end of team/players  
    end #end of game_hash 
    most_rebounds
end #end of method 

  #some guidance in structure for the method above  
  #find player with largest shoe
  #set the largest shoe = to zero 
  # if the current shoe size is larger than zero
  #largest shoe size is that specific player 
  #return that players number of rebounds 
  
  def most_points_scored
    most_scored = 0
    player_with_most_scored = 0 
    game_hash.map do |location, team|
      team[:players].map do |individual_player|
        if individual_player[:points] > most_scored
          most_scored = individual_player[:points]
          player_with_most_scored = individual_player[:player_name]
        end #if statement   
      end #end of team/players   
    end #end of game_hash   
    player_with_most_scored
  end #end of method 
  
  
 
def winning_team
  total_points = 0 #initialize points at zero 
  
  win_team = '' #set win team to an empty string 
  
  game_hash.each do |location, team| #iterating over game hash
    team_points = 0 #initialize team points at zero 
    
    team_name = game_hash[location][:team_name] 
    # set team name = to game_hash at the the location at the  # :team name 
  
    team[:players].each do |player| #iterate over players 
    
      points = player[:points] # set points = player points 
      team_points += points #team points is the addition of every single point value from each player
  
      #binding.pry 
    end #teamplayers 
  
    win_team, total_points = team_name, team_points 
    if team_points > total_points
   
    #binding.pry 

  end #gamehash 
   return win_team

end #method 

# # most similiar to most scored points 
# def player_with_longest_name
#   longest_name = ''
#   longest_length = 0 
#   game_hash.map do |location,team|
#     team[:players].map do |player|
#       name = player[:player_name]
#       #layered down to iterate through player names 
#       name_length = player[:player_name].length 
#       longest, name_length, if name_length > longest_length
#     end   
#   end 
#   longest_name
# end 

def player_with_longest_name
  longest = ''
  longest_length = 0
  game_hash.each do |location, team|
    team[:players].each do |player|
      name_length = player[:player_name].length
      longest, longest_length = player[:player_name], name_length 
        if name_length > longest_length
        end 
    end
     return longest
  end 

def long_name_steals_a_ton?
  steals_most = ''
  most_steals = 0
  game_hash.each do |location, keys|
    keys[:players].each do |player|
      steals_most, most_steals = player[:player_name], player[:steals] 
        if player[:steals] > most_steals
        end         
      end #end of game hash iteration 
   end #end of player iteration 
  return true if steals_most == player_with_longest_name
end #end of method 

