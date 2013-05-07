source 'https://rubygems.org'
ruby '2.0.0'

gem 'sinatra',     require: 'sinatra/base'
gem 'addressable', require: 'addressable/uri'
gem 'rake',        require: nil
gem 'httpclient'
gem 'multi_json'
gem 'bcrypt-ruby', require: 'bcrypt'
gem 'sidekiq'
gem 'sequel'
gem 'sprockets'
gem 'yui-compressor', require: 'yui/compressor'
gem 'slim'
gem 'tzinfo'
gem 'rack-time-zone-header'
gem 'sinatra-flash', require: 'sinatra/flash'
gem 'faker'
gem 'pony'
gem 'sqlite3'

platform :mri do
  gem 'pg'
  gem 'rainbows'
  gem 'hiredis', require: 'redis/connection/hiredis'
  gem 'oj'

  group :development, :test do
    gem 'pry'
    gem 'pry-debugger'
  end
end

group :development do
  gem 'shotgun', require: nil
end

group :test do
  gem 'fabrication',        require: 'fabrication'
  gem 'minitest'
  gem 'minitest-reporters', require: 'minitest/reporters'
  gem 'rack-test',          require: 'rack/test'
  gem 'webmock'
  gem 'webrat'
  gem 'mocha',              require: nil

  platform :mri do
    gem 'simplecov',        require: nil
  end
end
