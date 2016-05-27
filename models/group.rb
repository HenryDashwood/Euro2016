require 'pry-byebug'
require_relative('../db/sql_runner')

class Group

  attr_accessor( :id, :name )

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def self.map_items(sql)
    groups = SqlRunner.run(sql)
    result = groups.map {|group| Group.new(group)}
    return result   
  end

  def self.map_item(sql)
    result = Group.map_items(sql)
    return result.first
  end

  def self.find( id )
    sql = "SELECT * FROM groups WHERE id=#{id}"
    return Group.map_item( sql );
  end

  def self.all()
    sql = "SELECT * FROM groups"
    return Group.map_items( sql )
  end

  def teams
    sql = "SELECT * FROM teams WHERE group_id=#{@id}"
    return Team.map_items( sql ) 
  end

  def save
    sql = "INSERT INTO groups (name)
            VALUES ( '#{@name}' ) 
            RETURNING *"
    return Group.map_item(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM groups"
    SqlRunner.run(sql)
  end 

  

end