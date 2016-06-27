require_relative 'player'
require_relative 'match'
require_relative 'team'
require_relative '../db/runner'
require 'pry-byebug'

class League

  attr_reader :matches

  def initialize(runner)
    @matches = Match.all(runner)
    @runner = runner
  end

  def refresh_matches()
    @matches = Match.all(@runner)
    return @matches
  end

  def count_matches()
    return @matches.size()
  end

  def get_home_games_by_team(team_name)
    sql = "SELECT matches.* FROM matches INNER JOIN teams on teams.id = matches.home_team_id WHERE teams.name = '#{team_name}'"
    result = Match.map_all( sql,@runner )
    return result
  end

  def get_away_games_by_team(team_name)
    sql = "SELECT matches.* FROM matches INNER JOIN teams on teams.id = matches.away_team_id WHERE teams.name = '#{team_name}'"
    result = Match.map_all( sql,@runner )
    return result
  end

  def get_all_games_by_team(team_name)
    home = get_home_games_by_team(team_name)
    away = get_away_games_by_team(team_name)
    result = home.push(*away)
    return result
  end

  def get_team_score(team_name)
    home_score = 0
    away_score = 0
    home = get_home_games_by_team(team_name)
    away = get_away_games_by_team(team_name)
    home.each {|game| home_score += game.home_score}
    away.each {|game| away_score += game.away_score}
    total_score = home_score + away_score
    return total_score
  end

  def get_team_id(team_name)
    sql = "SELECT teams.id FROM teams WHERE teams.name = '#{team_name}'"
    result = @runner.run(sql)
    return result.first['id'].to_i
  end

  def get_team_name(team_id)
    sql = "SELECT teams.name FROM teams WHERE teams.id = '#{team_id}'"
    result = @runner.run(sql)
    return result.first['name']
  end

  def get_team_wins(team_id)
    name = get_team_name(team_id)
    games = get_all_games_by_team(name)
    wins = 0
    losses = 0
    draws = 0
      for game in games
        wins +=1 if (game.home_team == team_id) && (game.home_score > game.away_score)
        draws +=1 if (game.home_score == game.away_score)
        losses += 1 if (game.home_team == team_id) && (game.home_score < game.away_score)
      end
    return [name,wins,draws,losses]
  end

  def rank_teams()
    teams = Team.all(@runner)
    team_results = teams.map {|team| get_team_wins(team.id)}
    team_results.sort! {|a,b| [b[1],b[2],b[3]] <=> [a[1],a[2],a[3]]}
    # team_results.sort! do |a,b|
    #   b[3] <=> a[3]
    # end
    # team_results.sort! do |a,b|
    #   b[2] <=> a[2]  
    # end
    # team_results.sort! do |a,b|
    #   b[1] <=> a[1]
    # end
    return team_results
  end

  def display_ranking()
    ranked_results = rank_teams()
    count = 1
    for result in ranked_results 
      score = get_team_score(result[0])
      puts "#{count}: #{result[0]} with #{result[1]} wins, #{result[2]} draws & #{result[3]} losses in #{result[1] + result[2] + result[3]} games. They got #{score} hits."
      count += 1
    end
  end
end