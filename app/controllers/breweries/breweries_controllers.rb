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

  get '/map' do
    @breweries = Breweries.where("user_id = ?", current_user.id).select("name, latitude, longitude")
    @markers = @breweries.map do |b|
       { :title => b.name, :lat => b.latitude, :lng => b.longitude }
    end
    erb :'map/map', :layout => false
  end

  post '/brewery/:id' do
    @brewery = Breweries.find_by_id(params[:id])
    erb :'breweries/edit'
  end

  patch '/breweries/:id/edit' do
    @brewery = Breweries.find_by_id(params[:id])
    @brewery.name = params[:brew_name]
    @brewery.city = params[:brew_city]
    @brewery.state = params[:brew_state]
    @brewery.notes = params[:brew_notes]
    @brewery.save
    redirect to "/breweries"
  end
end
