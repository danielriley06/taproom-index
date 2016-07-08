class Breweries < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  belongs_to :user

  validates :first_name, :last_name, :email, presence: true

  def address
    [city, state].join(', ')
  end

  geocoded_by :address
  after_validation :geocode
  after_save :geocode
end
