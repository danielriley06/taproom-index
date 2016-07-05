class Breweries < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  belongs_to :user

  def address
    [city, state].join(', ')
  end

  geocoded_by :address
  after_validation :geocode
end
