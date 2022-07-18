require 'pry'

# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

# put all players together in one Hash
def team_players
    game_hash[:home][:players] + game_hash[:away][:players]
end

def locate_player(player_name)
    player_stats = team_players.find {|player| player[:player_name] == player_name}
end

def num_points_scored(player_name)
    locate_player(player_name)[:points]
end

def shoe_size(player_name)
    locate_player(player_name)[:shoe]
end

def team_colors(team_name)
    game_hash.each do |location, team_data|
        if team_data[:team_name] == team_name
            return team_data[:colors]
        end
    end
end

def team_names
    game_hash.map do |location, team_data|
        team_data[:team_name]
    end
end

def player_numbers(team_name)
    game_hash.each do |location, team_data|
        if team_data[:team_name] == team_name
            return team_data[:players].map {|player| player[:number]}
        end
    end
end

def player_stats(player_name)
    locate_player(player_name)
end

def find_largest_shoe_size
    largest_shoe_size = 0
    player_name = ""

    team_players.each do |player|
        if player[:shoe] > largest_shoe_size
            largest_shoe_size = player[:shoe]
            player_name = player[:player_name]
        end
    end

    player_name
end

def big_shoe_rebounds
    player_largest_shoe = find_largest_shoe_size
    locate_player(player_largest_shoe)[:rebounds]
end

# puts num_points_scored('Alan Anderson')
# puts num_points_scored("DeSagna Diop")

# puts shoe_size('Alan Anderson')
# puts shoe_size("DeSagna Diop")

# p team_colors('Brooklyn Nets')
# puts team_colors("Charlotte Hornets")

# p team_names

# p player_numbers('Brooklyn Nets')
# puts player_numbers("Charlotte Hornets")

# p player_stats('Alan Anderson')
# puts player_stats("DeSagna Diop")

# p player_largest_show_size

# p big_shoe_rebounds
