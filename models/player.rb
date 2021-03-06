require_relative 'team'

class Player
  attr_reader :id, :name, :team
  def initialize (options, runner)
    @id = options['id'].to_i
    @name = options['name']
    @team = options['team_id'].to_i
    @runner = runner
  end

  def save()
    sql = "INSERT INTO players (name, team_id) VALUES ('#{@name}', #{@team}) RETURNING *"
    return Player.map_one( sql, @runner)
  end

   def self.all(runner)
     sql = "SELECT * FROM players"
     return Player.map_all(sql, runner)
   end

   def self.delete_all(runner)
     sql = "DELETE FROM players"
     runner.run( sql )
   end
   
  def self.map_all( sql,runner )
    players = runner.run(sql)
    result = players.map {|player| Player.new( player, runner )}
    return result
  end

  def self.map_one( sql, runner )
    result = Player.map_all( sql, runner)
    return result.first
  end

  def team()
    sql = "SELECT * FROM teams WHERE id = #{@team}"
    result = Team.map_one(sql, @runner)
    return result.name
  end

end