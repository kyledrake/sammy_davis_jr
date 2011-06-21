Encoding.default_internal = 'UTF-8'
require 'rubygems'
require 'bundler/setup'
Bundler.require
require File.join(File.expand_path(File.dirname(__FILE__)), 'helpers.rb')
Dir.glob(['lib', 'models'].map! {|d| File.join File.expand_path(File.dirname(__FILE__)), d, '*.rb'}).each {|f| require f}

puts "Starting in #{Sinatra::Base.environment} mode.."

class Controller < Sinatra::Base
  register Sinatra::Synchrony
  register Sinatra::Namespace
  register Sinatra::Flash

  set :method_override, true
  set :public,          'public'
  set :sessions,        true
  set :session_secret,  'PUT SOMETHING HERE'
  set :erubis,          :escape_html => true

  configure :development do
    Bundler.require :development
    DataMapper::Logger.new STDOUT, :debug
    DataMapper.setup :default, 'postgres://user:pass@localhost/database_dev'
  end

  configure :test do
    DataMapper.setup :default, 'postgres://user:pass@localhost/database_test'
  end

  configure :production do
    DataMapper.setup :default, 'postgres://user:pass@localhost/database'
  end
end

require File.join('.', 'controller.rb')