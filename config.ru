# thin start -p 4567 -R config.ru
# thin start -p 4567 -e production -R config.ru
require 'environment'
require 'app'

use Rack::CommonLogger, ACCESS_LOG
use Rack::ShowExceptions if ENV['RACK_ENV'] == 'development'
use Rack::MethodOverride
use Rack::Session::Cookie, :key => 'app.session',
                           :path => '/',
                           :expire_after => 2592000, # In seconds
                           :secret => 'PUT_SOMETHING_HERE'

run App
