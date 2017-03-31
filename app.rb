require('sinatra')
  require('sinatra/reloader')
  also_reload('lib/**/*.rb')
  require('./lib/teamtracker')
  require('./lib/members')

get('/') do
  erb(:index)
end

get('/team_form') do
  erb(:team_form)
end

get('/teams') do
  @@teams = Team.all()
  erb(:teams)
end

post('/teams') do
  teamname = params.fetch('teamname')
  industry = params.fetch('industry')
  new_team = Team.new({:teamname => teamname, :industry => industry})
  new_team.save()
  @@teams = Team.all()
  erb(:teams)
end

get('/teams/:id') do
  @team = Team.find(params.fetch('id').to_i())
  erb(:team)
end

get('/teams/:id/member_form') do
  @team = Team.find(params.fetch('id').to_i())
  erb(:member_form)
end

post('/members') do
  first = params.fetch('first')
  last = params.fetch('last')
  position = params.fetch('position')
  @member = Member.new({:first => first, :last => last, :position => position})
  @member.save()
  @team = Team.find(params.fetch('team_id').to_i())
  @team.add_member(@member)
  erb(:teams)
end
