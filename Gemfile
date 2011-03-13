source :rubygems
gem 'dm-core',           '1.0.2'
gem 'dm-validations',    '1.0.2'
gem 'dm-aggregates',     '1.0.2'
gem 'dm-timestamps',     '1.0.2'
gem 'dm-mysql-adapter',  '1.0.2'
gem 'dm-migrations',     '1.0.2', :require => nil
gem 'yajl-ruby',         '0.8.1', :require => 'yajl/json_gem'
gem 'sinatra',           '1.2.0', :require => 'sinatra/base'
gem 'sinatra-namespace', '0.6.1', :require => 'sinatra/namespace'
gem 'rainbows',                   :require => nil
gem 'shotgun',                    :require => nil

group :development do
  platforms :mri_18 do
    gem 'ruby-debug'
  end

  platforms :mri_19 do
    gem 'ruby-debug19', :require => 'ruby-debug'
  end
end

group :test do
  gem 'dm-sweatshop',      '1.0.2'
  gem 'contest',           '0.1.2'
  gem 'rack-test',         '0.5.6', :require => 'rack/test'
end