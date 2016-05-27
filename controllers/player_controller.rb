require 'sinatra'
require 'sinatra/contrib/all' if development? 
require 'pry-byebug'
require_relative '../models/group'
require_relative '../models/match'
require_relative '../models/team'
require_relative '../models/player'

get '/players' do 
  @players = Player.all
  erb :'players/index'
end

get '/players/new' do
  @teams = Team.all()
  erb :'players/new'
end 

post '/players' do
  @Player = Player.new(params)
  @Player.save
  redirect to('/players')
end

get '/players/:id' do
  @Player = Player.find(params[:id])
  erb :'players/show'
end

delete '/players/:id/' do
  Player.delete(params[:id])
  redirect to('/players')
end