require 'sinatra'
require 'sinatra/contrib/all' if development? 
require 'pry-byebug'
require_relative('controllers/match_controller.rb')
require_relative('controllers/player_controller.rb')
require_relative('controllers/team_controller.rb')
require_relative('controllers/group_controller.rb')
require_relative('models/result.rb')
require_relative('models/match.rb')
require_relative('models/group.rb')
require_relative('models/player.rb')

# Match.delete_all()
# Team.delete_all()

get '/results' do 
  @result = Result.new( Match.all(), Group.all() )
  erb( :results )
end
