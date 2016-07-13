require 'bundler/setup'
Bundler.require(:default)

require_all 'app'

configure :production do
 db = URI.parse(ENV['postgres://galhabotqupxfg:cIVhlPt4Wsck16uqJYch48YPx2@ec2-54-243-199-161.compute-1.amazonaws.com:5432/d89r24kfi4dmsj'] || 'postgres:///localhost/mydb')

 ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
 )
end
