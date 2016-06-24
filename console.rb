require_relative './models/match'
require_relative './models/team'
require_relative './db/runner'
require 'pry-byebug'


runner = SqlRunner.new({dbname: 'dodgeball', host: 'localhost'})

Match.delete_all(runner)
Team.delete_all(runner)

team1 = Team.new({'name' => 'Kicky Left Legs'}, runner).save
team2 = Team.new({'name' => 'Catchy Cheaters'}, runner).save
team3 = Team.new({'name' => 'Dive Dive Dive'}, runner).save
team4 = Team.new({'name' => 'Shoeballs'}, runner).save
team5 = Team.new({'name' => 'Nike FC'}, runner).save
team6 = Team.new({'name' => 'Soccerers'}, runner).save
team7 = Team.new({'name' => 'Kickmen'}, runner).save
team8 = Team.new({'name' => 'Three Leg Wonders'}, runner).save
team9 = Team.new({'name' => 'Referees'}, runner).save
team10 = Team.new({'name' => 'Corporate Hospitality'}, runner).save

Match1 = Match.new({'home_team' => team2.id, 'away_team' => team4.id, 'home_score' => 3, 'away_score' => 5},runner).save
Match2 = Match.new({'home_team' => team5.id, 'away_team' => team6.id, 'home_score' => 1, 'away_score' => 1},runner).save
Match3 = Match.new({'home_team' => team7.id, 'away_team' => team10.id, 'home_score' => 0, 'away_score' => 4},runner).save
Match4 = Match.new({'home_team' => team9.id, 'away_team' => team8.id, 'home_score' => 2, 'away_score' => 1},runner).save
Match5 = Match.new({'home_team' => team1.id, 'away_team' => team3.id, 'home_score' => 3, 'away_score' => 3},runner).save
Match6 = Match.new({'home_team' => team1.id, 'away_team' => team3.id, 'home_score' => 1, 'away_score' => 0},runner).save
Match7 = Match.new({'home_team' => team1.id, 'away_team' => team3.id, 'home_score' => 2, 'away_score' => 4},runner).save

binding.pry
nil