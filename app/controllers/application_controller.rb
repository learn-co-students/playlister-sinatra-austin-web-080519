class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  # song controls
  get '/songs' do
    @songs = Song.all 
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs/new' do
    @song = Song.find_by_slug(params[:id])
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    erb :'/songs/edit'
  end

# genre controls

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    erb :'/genres/show'
  end

  #artist controls

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
end

get 'artists/:slug' do
    erb :'/artists/show'
end

end