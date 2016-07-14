require 'bundler/setup'
Bundler.require(:default)

require_all 'app'

configure :development do
  db_development = {adapter: 'sqlite3', database: 'development'}

  ActiveRecord::Base.establish_connection(db_development)
end

configure :production do
 db = URI.parse(ENV['DATABASE_URL'])

 ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
 )
end
