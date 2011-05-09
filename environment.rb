Encoding.default_internal = 'UTF-8'
require 'rubygems'
require 'bundler/setup'
Bundler.require
require File.join(File.expand_path(File.dirname(__FILE__)), 'helpers.rb')
Dir.glob(['lib', 'models'].map! {|d| File.join File.expand_path(File.dirname(__FILE__)), d, '*.rb'}).each {|f| require f}

puts "Starting in #{Sinatra::Base.environment} mode.."

class Sinatra::Base
  configure :development do
    DataMapper::Logger.new STDOUT, :debug
    DataMapper.setup :default, 'mysql://user:pass@localhost/database_dev'
    Bundler.require :development if development?
  end

  configure :test do
    DataMapper.setup :default, 'mysql://user:pass@localhost/database_test'
  end

  configure :production do
    DataMapper.setup :default, 'mysql://user:pass@localhost/database'
  end

  register Sinatra::Synchrony
  use Rack::ShowExceptions if development?
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'PUT SOMETHING HERE'
  set :public, 'public'
  set :dump_errors, true
  helpers Helpers
  register Sinatra::Namespace
end

require File.join('.', 'controller.rb')