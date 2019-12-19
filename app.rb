require('sinatra')
require('sinatra/reloader')
require('./lib/stage')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @stages = Stage.sorted
  erb(:stages)
end

get('/stages') do
  @stages = Stage.sorted
  erb(:stages)
end

post('/stages') do
  name = params[:stage_name]
  genre = params[:stage_genre]

  stage = Stage.new(name, genre, nil)
  stage.save()
  @stages = Stage.sorted
  erb(:stages)
end

get('/stages/new') do
  erb(:new_stage)
end
