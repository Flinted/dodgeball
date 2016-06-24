class Match

  def intitialize(options, runner)
    @id = options['id']
    @home_team = options['home_team']
    @away_team = options['away_team']
    @home_score = options['home_score']
    @away_score = options['away_score']
    @runner = runner
  end

  def save()

  end

  def self.all(runner)

  end

  def self.map_all(runner)

  end

  def self.map_one(runner)

  end
end