require './config/environment'

use Rack::MethodOverride
use UsersController
use PoolsController
run ApplicationController