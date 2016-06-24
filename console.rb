require_relative './models/match'
require_relative './models/team'
require_relative './models/runner'


runner = SqlRunner.new({dbname: 'dodgeball', host: 'localhost'})

Match.delete_all
Team.delete_all

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

Match1 = Match.new({'home_team' => team1.id, 'away_team' => team3.id, 'home_score' => 3, 'away_score' => 5})