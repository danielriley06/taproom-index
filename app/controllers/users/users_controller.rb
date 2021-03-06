class UsersController < ApplicationController

  get '/signup' do
    if !session[:user_id]
      erb :'users/signup'
    else
      redirect to '/breweries'
    end
  end

  post '/signup' do
    @user = User.create(params)
    if @user.save
      flash[:notice] = "Successfully added new user."
      session[:user_id] = @user.id
      redirect '/breweries'
    else
      flash[:error] = @user.errors.full_messages
      flash[:errors_list] = @user.errors.messages
      redirect "/signup"
    end
  end

  get '/login' do
    @error_message = params[:error]
    if !session[:user_id]
      erb :'users/login', locals: {message: "Invalid username or password! Please try again."}
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
      redirect to '/login'
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

  patch '/user/account' do
    @user = current_user
    @user.first_name = params[:signup_firstname]
    @user.last_name = params[:signup_lastname]
    @user.email = params[:signup_email]
    @user.password = params[:signup_password]
    @user.save
    erb :'users/account'
  end

end
