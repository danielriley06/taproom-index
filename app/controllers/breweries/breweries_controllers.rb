class BreweriesController < ApplicationController
  get '/breweries' do
    erb :'breweries/breweries'
  end
end
