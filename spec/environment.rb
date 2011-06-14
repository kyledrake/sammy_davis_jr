ENV['RACK_ENV'] = 'test'
raise 'Forget it.' if ENV['RACK_ENV'] == 'production'
require File.join(File.expand_path(File.dirname(__FILE__)), '..', 'environment.rb')
require 'minitest/autorun'
require 'wrong/adapters/minitest'
Wrong.config.alias_assert :expect_that
Bundler.require :test
require File.join(File.expand_path(File.dirname(__FILE__)), 'fixtures.rb')

def mock_app(base=Sinatra::Base, &block); @app = Sinatra.new(base, &block) end
def app=(new_app); @app = new_app end

=begin
def file_upload_hash
  {:type => "image/jpeg",
   :tempfile => Rack::Test::UploadedFile.new(File.join('tests', 'files', 'rosemarys-baby.jpg'), "image/jpeg"),
   :name => "photo[file]",
   :filename=>"rosemarys-baby.jpg",
   :head=>"Content-Disposition: form-data; name=\"photo[file]\"; filename=\"rosemarys-baby.jpg\"\r\nContent-Type: image/jpeg\r\nContent-Length: 28333\r\n"}
end
=end
