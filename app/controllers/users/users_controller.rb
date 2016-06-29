class UsersController < ApplicationController

  get '/signup' do
    if !session[:user_id]
      erb :'users/signup'
    else
      redirect to '/clubs'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(:email => params[:signup_email], :password => params[:password])
      session[:user_id] = @user.id
      redirect '/breweries'
    end
  end

  get '/login' do
    @error_message = params[:error]
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/breweries'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/breweries"
    else
      redirect to '/signup'
    end
  end

end
