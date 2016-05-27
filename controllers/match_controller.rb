require 'sinatra'
require 'sinatra/contrib/all' if development? 
require 'pry-byebug'
require_relative '../models/group'
require_relative '../models/match'
require_relative '../models/team'

get '/matches' do
  @matches = Match.all
  erb :'matches/index'
end

get '/matches/new' do
  @teams = Team.all
  erb :'matches/new'
end

post '/matches' do
  match = Match.new(params)
  @match = match.save
redirect to('/matches/new')
end

get '/matches/:id' do
  @match = Match.find(params[:id])
  erb :'matches/show'
end

get '/matches/:id/edit' do
  @match = Match.find(params[:id])
  @groups = Group.all
  @teams = Team.all
  erb(:'matches/edit')
end

put '/matches/:id' do
  @match = Match.update(params)
  redirect to("/matches/#{params[:id]}")
end

delete '/matches/:id' do
  Match.delete(params[:id]) 
  redirect to('/matches')
end