source :rubygems
gem 'dm-core',           '1.1.0'
gem 'dm-validations',    '1.1.0'
gem 'dm-aggregates',     '1.1.0'
gem 'dm-timestamps',     '1.1.0'
gem 'dm-mysql-adapter',  '1.1.0'
gem 'dm-migrations',     '1.1.0', :require => nil
gem 'yajl-ruby',         '0.8.1', :require => 'yajl/json_gem'
gem 'sinatra',           '1.2.0', :require => 'sinatra/base'
gem 'sinatra-namespace', '0.6.1', :require => 'sinatra/namespace'
gem 'async_sinatra',     '0.5.0', :require => 'sinatra/async'
gem 'thin',              '1.2.10'

# EM-Synchrony is an EventMachine power toy that allows you to do concurrent programming easily for some blocking operations.
# This is fairly difficult to describe, so I won't make an attempt.. Consult other resources to understand what this is for.
gem 'em-synchrony',      '0.2.0', :require => nil

group :development do
  gem 'shotgun', :require => nil

  platforms :mri_18 do
    gem 'ruby-debug'
  end

  platforms :mri_19 do
    gem 'ruby-debug19', :require => 'ruby-debug'
  end
end

group :test do
  gem 'dm-sweatshop',      '1.1.0'
  gem 'contest',           '0.1.2'
  gem 'rack-test',         '0.5.6', :require => 'rack/test'
end
