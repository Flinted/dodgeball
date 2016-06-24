class Team

  def initialize(options, runner)
    @id = options['id']
    @name =options['name']
    @runner = runner
  end

  def save()

  end

  def self.all(runner)

  end

  def self.delete_all(runner)
    sql = "DELETE FROM teams"
    runner.run( sql )
  end
  
  def self.map_all(runner)

  end

  def self.map_one(runner)

  end

end