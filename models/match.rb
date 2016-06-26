require_relative 'team'

class Match

  attr_reader :id, :home_team, :away_team, :home_score, :away_score

  def initialize(options, runner)
    @id = options['id'].to_i
    @home_team = options['home_team_id'].to_i
    @away_team = options['away_team_id'].to_i
    @home_score = options['home_score'].to_i
    @away_score = options['away_score'].to_i
    @runner = runner
  end

  def save()
    sql = "INSERT INTO matches (home_team_id, away_team_id, home_score, away_score) VALUES (#{@home_team},#{@away_team},#{@home_score},#{@away_score}) RETURNING *"
    return Match.map_one( sql, @runner)
  end

  def self.all(runner)
    sql = "SELECT * FROM matches"
    Match.map_all(sql, runner)
  end

  def self.delete_all(runner)
    sql = "DELETE FROM matches"
    runner.run( sql )
  end

  def self.map_all( sql,runner )
    matches = runner.run(sql)
    result = matches.map {|match| Match.new(match, runner)}
    return result
  end

  def self.map_one( sql, runner )
    result = Match.map_all( sql, runner)
    return result.first
  end
end