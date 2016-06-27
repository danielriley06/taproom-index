require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  helpers Sinatra::TaproomIndex::Helpers

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "brewery_secret"
  end

  get '/?' do
    erb :index
  end
end
