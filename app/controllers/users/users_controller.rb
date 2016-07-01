class UsersController < ApplicationController

  helpers ActionView::Helpers::FormTagHelper

  get '/signup' do
    if !session[:user_id]
      erb :'users/signup'
    else
      redirect to '/breweries'
    end
  end

  post '/signup' do
    if params[:signup_email] == "" || params[:signup_password] == ""
      redirect to '/signup'
    else
      @user = User.create(:email => params[:signup_email], :password => params[:signup_password], :first_name => params[:signup_firstname], :last_name => params[:signup_lastname])
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
    user = User.find_by(:email => params[:login_email])
    if user && user.authenticate(params[:login_password])
      session[:user_id] = user.id
      redirect "/breweries"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/'
    else
      redirect to '/'
    end
  end

  get '/user/account' do
    @user = current_user
    erb :'users/account'
  end

  post '/user/account' do
    @user = current_user
    erb :'users/account'
  end

end
