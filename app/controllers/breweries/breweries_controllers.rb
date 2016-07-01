class BreweriesController < ApplicationController
  ['/breweries', '/breweries/new'].each do |path|
    before path do
      redirect_if_not_logged_in
    end
  end

  get '/breweries' do
    @breweries = Breweries.where("user_id = ?", current_user.id)
    erb :'breweries/breweries'
  end

  post '/breweries/new' do
    @breweries = Breweries.create(:name => params[:brew_name], :city => params[:brew_city], :state => params[:brew_state], :notes => params[:brew_notes], :user_id => current_user.id)
    redirect to "/breweries"
  end
end
