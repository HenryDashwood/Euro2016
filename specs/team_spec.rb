require('minitest/autorun')
require('pry-byebug')
require_relative('../models/group')
require_relative('../models/match')
require_relative('../models/team')

class TestGroup < Minitest::Test

  def setup
    Match.delete_all
    Team.delete_all
    @team1 = Team.new({'name' => 'Albania'}).save
    @team2 = Team.new({'name' => 'France'}).save
    @team3 = Team.new({'name' => 'Romania'}).save
    @team4 = Team.new({'name' => 'Switzerland'}).save
  end

  def Test_team_has_name
    assert_equal('Albania', @team1.name)
  end

end