require 'bundler/setup'
Bundler.require(:default)

require_all 'app'

ActiveRecord::Base.establish_connection(ENV['production'] || 'postgres://galhabotqupxfg:cIVhlPt4Wsck16uqJYch48YPx2@ec2-54-243-199-161.compute-1.amazonaws.com:5432/d89r24kfi4dmsj')
