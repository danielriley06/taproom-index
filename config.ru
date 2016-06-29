require './config/environment'

use Rack::MethodOverride
use UsersController
use BreweriesController
run ApplicationController
