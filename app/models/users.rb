class User < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_secure_password

  has_many :breweries

  def name
    [first_name, last_name].join(" ")
  end
end
