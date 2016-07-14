source 'http://rubygems.org'

gem 'sinatra'
gem 'sinatra-flash'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'json'
gem 'geocoder', :require => ['geocoder', 'geocoder/railtie']



group :test, :development do
  gem 'rspec'
  gem 'capybara'
  # gem 'selenium'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
