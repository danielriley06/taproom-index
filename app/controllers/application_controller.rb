require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  helpers ActionView::Helpers::FormTagHelper
  helpers Sinatra::TaproomIndex::Helpers

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "brewery_secret"
  end

  get '/?' do
    if !logged_in?
      erb :'welcome/welcome'
    else
      redirect to '/breweries'
    end

  end
end
