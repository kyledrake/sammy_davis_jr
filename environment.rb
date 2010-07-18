$KCODE = "UTF8"
require 'bundler'
Bundler.setup
require 'jcode'
require 'rack'
require 'sinatra/base'
require 'controller'
require 'helpers'
require 'dm-core'
require 'dm-validations'
require 'dm-migrations'
require 'dm-timestamps'

Dir.glob([File.join('lib', '*.rb'), File.join('models', '*.rb')]).each { |f| require f }

ENV['RACK_ENV'] ||= 'development'

puts "Starting in #{ENV['RACK_ENV']} mode.."

case ENV['RACK_ENV']
when 'development'
  DataMapper::Logger.new STDOUT, :debug
  DataMapper.setup :default, 'mysql://user:pass@localhost/database_dev'
when 'test'
  DataMapper.setup :default, 'mysql://user:pass@localhost/database_test'
when 'production'
  DataMapper.setup :default, 'mysql://user:pass@localhost/database'
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
Sinatra::Base.helpers Helpers
