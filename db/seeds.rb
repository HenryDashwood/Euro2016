require_relative('../models/group')
require_relative('../models/team')
require_relative('../models/match')
require_relative('../models/player')
require 'pry-byebug'

Group.delete_all
Match.delete_all
Team.delete_all
Player.delete_all

group1 = Group.new({ 'name' => 'Group A' }).save()

@team1 = Team.new({'name' => 'Albania', 'group_id' => group1.id}).save
@team2 = Team.new({'name' => 'France', 'group_id' => group1.id}).save
@team3 = Team.new({'name' => 'Romania', 'group_id' => group1.id}).save
@team4 = Team.new({'name' => 'Switzerland', 'group_id' => group1.id}).save

group2 = Group.new({ 'name' => 'Group B' }).save()

@team5 = Team.new({'name' => 'England', 'group_id' => group2.id}).save
@team6 = Team.new({'name' => 'Russia', 'group_id' => group2.id}).save
@team7 = Team.new({'name' => 'Slovakia', 'group_id' => group2.id}).save
@team8 = Team.new({'name' => 'Wales', 'group_id' => group2.id}).save

group3 = Group.new({ 'name' => 'Group C' }).save()

@team9 = Team.new({'name' => 'Germany', 'group_id' => group3.id}).save
@team10 = Team.new({'name' => 'Northern Ireland', 'group_id' => group3.id}).save
@team11 = Team.new({'name' => 'Poland', 'group_id' => group3.id}).save
@team12 = Team.new({'name' => 'Ukraine', 'group_id' => group3.id}).save

group4 = Group.new({ 'name' => 'Group D' }).save()

@team13 = Team.new({'name' => 'Croatia', 'group_id' => group4.id}).save
@team14 = Team.new({'name' => 'Czechia', 'group_id' => group4.id}).save
@team15 = Team.new({'name' => 'Spain', 'group_id' => group4.id}).save
@team16 = Team.new({'name' => 'Turkey', 'group_id' => group4.id}).save

group5 = Group.new({ 'name' => 'Group E' }).save()

@team17 = Team.new({'name' => 'Belgium', 'group_id' => group5.id}).save
@team18 = Team.new({'name' => 'Italy', 'group_id' => group5.id}).save
@team19 = Team.new({'name' => 'Ireland', 'group_id' => group5.id}).save
@team20 = Team.new({'name' => 'Sweden', 'group_id' => group5.id}).save

group6 = Group.new({ 'name' => 'Group F' }).save()

@team21 = Team.new({'name' => 'Austria', 'group_id' => group6.id}).save
@team22 = Team.new({'name' => 'Hungary', 'group_id' => group6.id}).save
@team23 = Team.new({'name' => 'Iceland', 'group_id' => group6.id}).save
@team24 = Team.new({'name' => 'Portugal', 'group_id' => group6.id}).save











