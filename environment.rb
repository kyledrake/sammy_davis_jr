require 'rubygems'

# Enable to be worldly.
# $KCODE = "UTF8"
# require 'jcode'
# require 'unicode'

require 'rack'
require 'sinatra/base'
require 'app'
require 'app_helpers'
require File.expand_path(File.join(File.dirname(__FILE__), 'vendor', 'gems', 'environment'))
Bundler.require_env

require 'dm-core'
require 'dm-validations'

Dir.glob(File.join('models', '*.rb')).each { |f| require f }
Dir.glob(File.join('lib', '*.rb')).each { |f| require f }
Dir.glob(File.join('gems', '*')).each do |gem_folder|
  $LOAD_PATH.unshift File.join(File.expand_path(File.dirname(__FILE__)), gem_folder, 'lib')
end

ENV['RACK_ENV'] ||= 'development'

case ENV['RACK_ENV']
when 'development'
  puts 'Starting in development mode..'
  
  ACCESS_LOG = STDOUT
  
  DataMapper::Logger.new(STDOUT, :debug)
  DataMapper.setup(:default, 'mysql://user:pass@localhost/database')
  
when 'production'
  puts 'Starting in production mode..'
  APP_LOG = File.new File.join('logs', 'app.log'), 'a'
  ACCESS_LOG = File.new File.join('logs', 'access.log'), 'a'
  STDOUT.reopen APP_LOG
  STDERR.reopen APP_LOG
  
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
