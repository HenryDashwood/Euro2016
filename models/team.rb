require 'pg'
require_relative '../db/sql_runner'

class Team

  attr_accessor :id, :name, :group_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @group_id = options['group_id'].to_i
  end

  def self.map_items(sql)
    teams = SqlRunner.run(sql)
    result = teams.map {|team| Team.new(team)}
    return result
  end

  def self.map_item(sql)
    result = Team.map_items(sql)
    return result.first
  end

  def save
    sql = "INSERT INTO teams (name, group_id) VALUES ('#{@name}', #{@group_id}) RETURNING *"
    return Team.map_item(sql)
  end

  def self.all 
    sql = "SELECT * FROM teams"
    return Team.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM teams WHERE id = #{id}"
    result = Team.map_item(sql)
  end

  def self.update(params)
    sql = "UPDATE teams SET name = '#{params['name']}', group_id = #{params['group_id']} WHERE id = #{params['id']}"
    result = Team.map_item(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end 

  def self.delete(id)
    sql = "DELETE FROM teams WHERE id = #{id}"
    SqlRunner.run(sql)
  end

end