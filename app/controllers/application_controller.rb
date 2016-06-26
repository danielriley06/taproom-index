require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  helpers Sinatra::TaproomIndex::Helpers

  register Sinatra::TaproomIndex::Routing::Sessions
  register Sinatra::TaproomIndex::Routing::Secrets

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "brewery_secret"
  end

  get '/' do
    erb :index
  end
end
