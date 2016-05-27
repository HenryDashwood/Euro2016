get '/teams' do 
  @teams = Team.all
  erb :'teams/index'
end

get '/teams/new' do
  @groups = Group.all()
  erb :'teams/new'
end 

post '/teams' do
  @team = Team.new(params)
  @team.save
  redirect to('/teams')
end

get '/teams/:id' do
  @team = Team.find(params[:id])
  erb :'teams/show'
end

get '/teams/:id/edit' do
  @team = Team.find(params[:id])
  @groups = Group.all
  erb(:'teams/edit')
end

put '/teams/:id' do
  @team = Team.update(params)
  redirect to("/teams/#{params[:id]}")
end

delete '/teams/:id' do
  Team.delete(params[:id])
  redirect to('/teams')
end






