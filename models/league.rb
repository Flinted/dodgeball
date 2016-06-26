require_relative 'player'
require_relative 'match'
require_relative 'team'
require_relative '../db/runner'

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

  
end