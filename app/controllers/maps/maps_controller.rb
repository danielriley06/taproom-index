class MapsController < ApplicationController
  ['/map'].each do |path|
    before path do
      redirect_if_not_logged_in
    end
  end

  get '/map' do
    @breweries = Brewery.where("user_id = ?", current_user.id).select("name, latitude, longitude, notes, rating")
    @markers = @breweries.map do |b|
       { :title => b.name, :lat => b.latitude, :lng => b.longitude, :notes => b.notes, :rating => b.rating }
    end
    erb :'map/map', :layout => false
  end

end
