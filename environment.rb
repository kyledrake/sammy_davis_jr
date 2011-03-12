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

case Sinatra::Base.environment
when :development
  DataMapper::Logger.new STDOUT, :debug
  DataMapper.setup :default, 'mysql://user:pass@localhost/database_dev'
when :test
  DataMapper.setup :default, 'mysql://user:pass@localhost/database_test'
when :production
  DataMapper.setup :default, 'mysql://user:pass@localhost/database'
else
  raise "Configuration not found for this environment: #{Sinatra::Base.environment}"
end

Sinatra::Base.use Rack::ShowExceptions if Sinatra::Base.development?
Sinatra::Base.use Rack::MethodOverride
Sinatra::Base.use Rack::Session::Cookie, :key => 'sammy.session',
                                         :path => '/',
                                         :expire_after => 2592000, # In seconds
                                         :secret => 'PUT_SOMETHING_HERE'
Sinatra::Base.set :static, true
Sinatra::Base.set :root, File.expand_path(File.dirname(__FILE__))
Sinatra::Base.set :public, File.join(Sinatra::Base.root, 'static')
Sinatra::Base.set :dump_errors, true
Sinatra::Base.helpers Helpers
Sinatra::Base.register Sinatra::Namespace
