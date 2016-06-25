require_relative './models/match'
require_relative './models/team'
require_relative './models/player'
require_relative './db/runner'
require 'pry-byebug'


runner = SqlRunner.new({dbname: 'dodgeball', host: 'localhost'})

Match.delete_all(runner)
Team.delete_all(runner)
Player.delete_all(runner)

team1 = Team.new({'name' => 'Artful Dodgers'}, runner).save
team2 = Team.new({'name' => 'Jammy Dodgers'}, runner).save
team3 = Team.new({'name' => 'Dodgy Dodgers'}, runner).save
team4 = Team.new({'name' => 'Old Codgers'}, runner).save
team5 = Team.new({'name' => 'Jammy Badgers'}, runner).save
team6 = Team.new({'name' => 'Dodgeridoos'}, runner).save
team7 = Team.new({'name' => 'Doge'}, runner).save
team8 = Team.new({'name' => 'Dojers'}, runner).save
team9 = Team.new({'name' => 'Dodgy folk'}, runner).save
team10 = Team.new({'name' => 'Egdod'}, runner).save

player1 = Player.new({'name' => "Bill", 'team' => team1.id }).save
player2 = Player.new({'name' => "Susan", 'team' => team9.id }).save
player3 = Player.new({'name' => "Frank", 'team' => team4.id }).save
player4 = Player.new({'name' => "Steve", 'team' => team7.id }).save
player5 = Player.new({'name' => "Sally", 'team' => team8.id }).save
player6 = Player.new({'name' => "Jason", 'team' => team3.id }).save
player7 = Player.new({'name' => "Bianca", 'team' => team4.id }).save
player8 = Player.new({'name' => "Cliff", 'team' => team2.id }).save


match1 = Match.new({'home_team' => team2.id, 'away_team' => team4.id, 'home_score' => 3, 'away_score' => 5},runner).save
match2 = Match.new({'home_team' => team5.id, 'away_team' => team6.id, 'home_score' => 1, 'away_score' => 1},runner).save
match3 = Match.new({'home_team' => team7.id, 'away_team' => team10.id, 'home_score' => 0, 'away_score' => 4},runner).save
match4 = Match.new({'home_team' => team9.id, 'away_team' => team8.id, 'home_score' => 2, 'away_score' => 1},runner).save
match5 = Match.new({'home_team' => team1.id, 'away_team' => team3.id, 'home_score' => 3, 'away_score' => 3},runner).save
match6 = Match.new({'home_team' => team8.id, 'away_team' => team5.id, 'home_score' => 1, 'away_score' => 0},runner).save
match7 = Match.new({'home_team' => team7.id, 'away_team' => team3.id, 'home_score' => 2, 'away_score' => 4},runner).save

binding.pry
nil