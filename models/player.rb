require 'pg'
require_relative '../db/sql_runner'

class Player

  attr_accessor :id, :name, :team_id, :goals

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @team_id = options['team_id'].to_i
    @goals = options['goals'].to_i
  end

  def self.map_items(sql)
    players = SqlRunner.run(sql)
    result = players.map {|player| Player.new(player)}
    return result
  end

  def self.map_item(sql)
    result = Player.map_items(sql)
    return result.first
  end

  def save
    sql = "INSERT INTO players (name, group_id, goals) VALUES ('#{@name}', #{@group_id}, #{@goals}) RETURNING *"
    return Player.map_item(sql)
  end

  def self.all 
    sql = "SELECT * FROM players"
    return Player.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM players WHERE id = #{id}"
    result = Player.map_item(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM players"
    SqlRunner.run(sql)
  end 

  def self.delete(options)
    sql = "DELETE FROM players WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

end