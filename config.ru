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

# These can be pushed back into the App class if you prefer, or if you would like to make multiple classes representing mini apps.
Sinatra::Base.set :static, true
Sinatra::Base.set :root, File.expand_path(File.dirname(__FILE__))
Sinatra::Base.set :public, File.join(Sinatra::Base.root, 'public')
Sinatra::Base.set :dump_errors, true
Sinatra::Base.helpers Sinatra::AppHelpers

run App
