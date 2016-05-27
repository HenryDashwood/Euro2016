require 'pg'
require_relative('../db/sql_runner')

class Match

  attr_accessor :id, :home_team_id, :away_team_id, :home_team_score, :away_team_score

  def initialize(options)
    @id = options['id'].to_i
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @home_team_score = options['home_team_score'].to_i
    @away_team_score = options['away_team_score'].to_i
  end

  def self.map_items(sql)
    matches = SqlRunner.run(sql)
    result = matches.map {|match| Match.new(match)}
    return result   
  end

  def self.map_item(sql)
    result = Match.map_items(sql)
    return result.first
  end

  def save
    sql = "INSERT INTO matches (home_team_id, away_team_id, home_team_score, away_team_score) VALUES (#{@home_team_id}, #{@away_team_id}, #{@home_team_score}, #{@away_team_score}) RETURNING *"
    return Match.map_item(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM matches WHERE id = #{id}"
    result = Match.map_item(sql)
  end

  def self.all
    sql = "SELECT * FROM matches"
    return Match.map_items(sql)
  end

  def self.update(params)
    sql = "UPDATE matches SET home_team_id = #{params['home_team_id']}, away_team_id = #{params['away_team_id']}, home_team_score = #{params['home_team_score']}, away_team_score = #{params['away_team_score']}, WHERE id = #{params['id']}"
    result = Team.map_item(sql)
  end 

  def self.delete_all
    sql = "DELETE FROM matches"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM matches WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def home_team_won?
    @home_team_score > @away_team_score
  end

  def away_team_won?
    @away_team_score > @home_team_score
  end

  def draw?
    @home_team_score == @away_team_score
  end

  def home_team_score
    @home_team_score
  end

  def away_team_score
    @away_team_score
  end

  def winner
    if home_team_won?
      sql = "SELECT teams.* FROM teams INNER JOIN matches ON matches.home_team = teams WHERE teams = #{@home_team}"
      return Team.map_item(sql)
    elsif away_team_won?
      sql = "SELECT teams.* FROM teams INNER JOIN matches ON matches.away_team = teams.id WHERE teams = #{@away_team}"
      return Team.map_item(sql)
    elsif Draw?
      return Draw
    end
  end

  def home_team 
    sql = "SELECT teams.* FROM teams, matches WHERE teams.id = matches.home_team_id AND matches.id = #{@id} AND teams.id = #{home_team_id}"
    return Team.map_item(sql)
  end

  def away_team
    sql = "SELECT teams.* FROM teams, matches WHERE teams.id = matches.away_team_id AND matches.id = #{@id} AND teams.id = #{away_team_id}"
    return Team.map_item(sql)
  end

end