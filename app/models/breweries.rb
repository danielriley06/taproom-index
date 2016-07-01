class Breweries < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  belongs_to :user

  def address
    [city, state].join(', ')
  end
end
