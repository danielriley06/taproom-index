class UsersController < ApplicationController

  post '/login' do
    user = Users.find_by(:username => params[:inputUsername])
    if user && user.authenticate(params[:inputPassword])
      session[:user_id] = user.id
      redirect "/breweries"
    else
      redirect to '/signup'
    end
  end
end
