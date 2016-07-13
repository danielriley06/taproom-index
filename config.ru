require './config/environment'
Geocoder::Railtie.insert
use Rack::MethodOverride
use UsersController
use BreweriesController
use MapsController
run ApplicationController
