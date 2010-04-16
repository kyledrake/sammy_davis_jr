$KCODE = "UTF8"

require 'rubygems'
require 'bundler'
Bundler.setup

require 'jcode'
require 'rack'
require 'sinatra/base'
require 'app'
require 'app_helpers'
require 'dm-core'
require 'dm-validations'

Dir.glob([File.join('lib', '*.rb'), File.join('models', '*.rb')]).each { |f| require f }

ENV['RACK_ENV'] ||= 'development'

case ENV['RACK_ENV']
when 'development'
  puts 'Starting in development mode..'
  
  DataMapper::Logger.new(STDOUT, :debug)
  DataMapper.setup(:default, 'mysql://user:pass@localhost/database')
  
when 'production'
  puts 'Starting in production mode..'
  DataMapper.setup(:default, 'mysql://user:pass@localhost/database')
else
  raise 'Configuration not found for this environment.'
end

Sinatra::Base.use Rack::ShowExceptions if ENV['RACK_ENV'] == 'development'
Sinatra::Base.use Rack::MethodOverride
Sinatra::Base.use Rack::Session::Cookie, :key => 'app.session',
                           :path => '/',
                           :expire_after => 2592000, # In seconds
                           :secret => 'PUT_SOMETHING_HERE'

Sinatra::Base.set :static, true
Sinatra::Base.set :root, File.expand_path(File.dirname(__FILE__))
Sinatra::Base.set :public, File.join(Sinatra::Base.root, 'static')
Sinatra::Base.set :dump_errors, true
Sinatra::Base.helpers Sinatra::AppHelpers
