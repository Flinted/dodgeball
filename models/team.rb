require_relative 'match'
require_relative 'player'

class Team

  attr_reader :name, :id
  def initialize(options, runner)
    @id = options['id'].to_i
    @name = options['name']
    @players= []
    @runner = runner
  end

  def save()
    sql = "INSERT INTO teams (name) VALUES ('#{@name}') RETURNING *"
    return Team.map_one( sql, @runner)
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

 def players()
  sql = "SELECT * FROM players WHERE players.team_id = #{id}"
  result = Player.map_all(sql,@runner)
  return result
 end
end