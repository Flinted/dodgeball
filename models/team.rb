class Team

  attr_reader :name, :id
  def initialize(options, runner)
    @id = options['id']
    @name =options['name']
    @runner = runner
  end

  def save()
    sql = "INSERT INTO teams (name) VALUES ('#{@name}'' RETURNING *"
    result = @runner.run(sql)
    return Team.new(result.first, @runner)
  end

  def self.all(runner)
    sql = "SELECT * FROM teams"
    return Team.map_all(sql, runner)
  end

  def self.delete_all(runner)
    sql = "DELETE FROM teams"
    runner.run( sql )
  end
  
 def self.map_all( sql,runner )
   teams = runner.run(sql)
   result = teams.map {|team| Team.new(team, runner)}
   return result
 end

 def self.map_one( sql, runner )
   result = Team.map_all( sql, runner)
   return result.first
 end
end