case RUBY_VERSION[0..2]
  when '1.8' then $KCODE = "u"
  when '1.9' then Encoding.default_internal = 'UTF-8'
end
require 'rubygems'
Bundler.require
require File.join(File.expand_path(File.dirname(__FILE__)), 'controller.rb')
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

  use Rack::ShowExceptions if development?
  use Rack::MethodOverride
  use Rack::Session::Cookie, :key => 'sammy.session',
                             :path => '/',
                             :expire_after => 2592000, # In seconds
                             :secret => 'PUT_SOMETHING_HERE'
  set :static, true
  set :root, File.expand_path(File.dirname(__FILE__))
  set :public, File.join(root, 'static')
  set :dump_errors, true
  helpers Helpers
  register Sinatra::Namespace
end