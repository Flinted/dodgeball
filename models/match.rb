class Match

  def intitialize(options, runner)
    @id = options['id']
    @home_team = options['home_team'].to_i
    @away_team = options['away_team'].to_i
    @home_score = options['home_score'].to_i
    @away_score = options['away_score'].to_i
    @runner = runner
  end

  def save()
    sql = "INSERT INTO matches (home_team_id, away_team_id, home_score, away_score) VALUES (#{@home_team},#{@away_team},#{@home_score},#{@away_score}"
  end

  def self.all(runner)

  end

  def self.delete_all(runner)
    sql = "DELETE FROM matches"
    runner.run( sql )
  end

  def self.map_all(runner)

  end

  def self.map_one(runner)

  end
end