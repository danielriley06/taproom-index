class Users < ActiveRecord::Base

  has_secure_password

  has_many :breweries


end
