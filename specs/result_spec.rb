require('minitest/autorun')
require('pry-byebug')
require_relative('../models/group')
require_relative('../models/match')
require_relative('../models/team')
require_relative('../models/result')

class TestResult < Minitest::Test

  def setup
    Group.delete_all
    Match.delete_all
    Team.delete_all

    group1 = Group.new({ 'name' => 'Group A' }).save()
    
    group2 = Group.new({ 'name' => 'Group B' }).save()

    @team1 = Team.new({'name' => 'Albania', 'group_id' => group1.id}).save
    @team2 = Team.new({'name' => 'France', 'group_id' => group1.id}).save
    @team3 = Team.new({'name' => 'Romania', 'group_id' => group1.id}).save
    @team4 = Team.new({'name' => 'Switzerland', 'group_id' => group1.id}).save
    
    @team5 = Team.new({'name' => 'Italy', 'group_id' => group2.id}).save
    @team6 = Team.new({'name' => 'England', 'group_id' => group2.id}).save
    @team7 = Team.new({'name' => 'Wales', 'group_id' => group2.id}).save
    @team8 = Team.new({'name' => 'Russia', 'group_id' => group2.id}).save


    @match1 = Match.new({'home_team_id' => @team2.id, 'away_team_id' => @team3.id, 'home_team_score' => 2, 'away_team_score' => 0}).save
    @match2 = Match.new({'home_team_id' => @team1.id, 'away_team_id' => @team4.id, 'home_team_score' => 0, 'away_team_score' => 1}).save
    @match3 = Match.new({'home_team_id' => @team3.id, 'away_team_id' => @team4.id, 'home_team_score' => 1, 'away_team_score' => 2}).save
    @match4 = Match.new({'home_team_id' => @team2.id, 'away_team_id' => @team1.id, 'home_team_score' => 3, 'away_team_score' => 1}).save
    @match5 = Match.new({'home_team_id' => @team3.id, 'away_team_id' => @team1.id, 'home_team_score' => 0, 'away_team_score' => 0}).save
    @match6 = Match.new({'home_team_id' => @team4.id, 'away_team_id' => @team2.id, 'home_team_score' => 2, 'away_team_score' => 3}).save

  
  end

  # def test_team_matches
  #   assert_equal(3, @result.team_matches(@team2.id))
  # end

  def test_team_points 
    assert_equal(9, @team2.team_points)
  end

end