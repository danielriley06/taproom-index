require 'bundler/setup'
Bundler.require(:default)

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

require_all 'app'
