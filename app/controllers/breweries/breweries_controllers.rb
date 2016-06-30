class BreweriesController < ApplicationController
  before '/breweries' do
    redirect_if_not_logged_in
  end

  get '/breweries' do
    @breweries = Breweries.all
    erb :'breweries/breweries'
  end
end
