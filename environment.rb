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

  set :raise_errors,    false
  set :show_exceptions, false
  set :method_override, true
  set :public,          'public'
  set :sessions,        true
  set :session_secret,  'PUT SOMETHING HERE'
  set :erubis,          :escape_html => true

  Faraday.default_adapter = :em_synchrony

  # async-aware Memcache client
  # Cache = Dalli::Client.new '127.0.0.1:11211', :async => true

  configure :development do
    use Rack::CommonLogger
    Bundler.require :development
  end

  configure :test do
  end

  configure :production do
  end

  not_found do
    erubis :'404'
  end

  error do
    # Implement error reporting such as Airbrake (formerly Hoptoad) here.
    erubis :'500'
  end
end

require File.join('.', 'controller.rb')