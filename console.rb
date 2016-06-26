require_relative './models/match'
require_relative './models/team'
require_relative './models/player'
require_relative './models/league'
require_relative './db/runner'
require 'pry-byebug'

runner = SqlRunner.new({dbname: 'dodgeball', host: 'localhost'})

Player.delete_all(runner)
Match.delete_all(runner)
Team.delete_all(runner)

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

teams = [team1,team2,team3,team4,team5,team6,team7,team8,team9,team10]

100.times do 
  teama = teams.sample.id 
  teamb = teams.sample.id
  while teama == teamb
  teama = teams.sample.id 
  teamb = teams.sample.id
  end
  Match.new({'home_team_id' => teama, 'away_team_id' => teamb, 'home_score' => rand(0..6), 'away_score' => rand(0..6)},runner).save
end

player1 = Player.new({'name' => "Bill", 'team_id' => team1.id }, runner).save
player2 = Player.new({'name' => "Susan", 'team_id' => team9.id }, runner).save
player3 = Player.new({'name' => "Frank", 'team_id' => team4.id }, runner).save
player4 = Player.new({'name' => "Steve", 'team_id' => team7.id }, runner).save
player5 = Player.new({'name' => "Sally", 'team_id' => team8.id }, runner).save
player6 = Player.new({'name' => "Jason", 'team_id' => team3.id }, runner).save
player7 = Player.new({'name' => "Bianca", 'team_id' => team4.id }, runner).save
player8 = Player.new({'name' => "Cliff", 'team_id' => team2.id }, runner).save

# match1 = Match.new({'home_team_id' => team1.id, 'away_team_id' => team2.id, 'home_score' => 3, 'away_score' => 5},runner).save
# match2 = Match.new({'home_team_id' => team1.id, 'away_team_id' => team2.id, 'home_score' => 1, 'away_score' => 1},runner).save
# match3 = Match.new({'home_team_id' => team3.id, 'away_team_id' => team4.id, 'home_score' => 0, 'away_score' => 4},runner).save
# match4 = Match.new({'home_team_id' => team2.id, 'away_team_id' => team4.id, 'home_score' => 2, 'away_score' => 1},runner).save
# match5 = Match.new({'home_team_id' => team1.id, 'away_team_id' => team3.id, 'home_score' => 3, 'away_score' => 3},runner).save
# match6 = Match.new({'home_team_id' => team3.id, 'away_team_id' => team2.id, 'home_score' => 1, 'away_score' => 0},runner).save
# match7 = Match.new({'home_team_id' => team4.id, 'away_team_id' => team3.id, 'home_score' => 2, 'away_score' => 4},runner).save

league1 = League.new(runner)
league1.display_ranking()
puts league1.get_team_score('Doge')
puts league1.get_team_score('Artful Dodgers')

# binding.pry
# nil
