class BreweriesController < ApplicationController
  ['/breweries', '/breweries/new'].each do |path|
    before path do
      redirect_if_not_logged_in
    end
  end

  get '/breweries' do
    @breweries = current_user.breweries
    erb :'breweries/breweries'
  end

  post '/breweries/new' do
    @brewery = Brewery.create(:name => params[:brew_name], :city => params[:brew_city], :state => params[:brew_state], :notes => params[:brew_notes], :user_id => current_user.id, :rating => params[:brew_rating])
    if @brewery.save
      redirect to "/breweries"
    else
      flash[:error] = @brewery.errors.full_messages
      flash[:errors_list] = @brewery.errors.messages
      redirect "/breweries"
    end
  end

  post '/brewery/:id' do
    @brewery = Brewery.find_by_id(params[:id])
    erb :'breweries/edit'
  end

  patch '/breweries/:id/edit' do
    @brewery = Brewery.find_by_id(params[:id])
    @brewery.name = params[:brew_name]
    @brewery.city = params[:brew_city]
    @brewery.state = params[:brew_state]
    @brewery.notes = params[:brew_notes]
    @brewery.rating = params[:brew_rating]
    @brewery.save
    if @brewery.save
      redirect to '/breweries'
    else
      flash[:error] = @brewery.errors.full_messages
      flash[:errors_list] = @brewery.errors.messages
      redirect '/breweries'
    end
  end
end
