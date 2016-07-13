require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  helpers Sinatra::TaproomIndex::Helpers
  register Sinatra::Flash

  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "brewery_secret"
  end

  get '/?' do
    if !logged_in?
      erb :'welcome/welcome', :layout => false
    else
      redirect to '/breweries'
    end

  end
end
