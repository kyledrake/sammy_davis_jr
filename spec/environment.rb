ENV['RACK_ENV'] = 'test'
raise 'Forget it.' if ENV['RACK_ENV'] == 'production'
require File.join(File.expand_path(File.dirname(__FILE__)), '..', 'environment.rb')
Bundler.require :test
require 'minitest/autorun'
require 'wrong/adapters/minitest'
require 'webmock'
require 'webmock/http_lib_adapters/em_http_request/em_http_request_1_x'
Wrong.config.alias_assert :expect_that
require File.join(File.expand_path(File.dirname(__FILE__)), 'fixtures.rb')

def mock_app(base=Sinatra::Base, &block); @app = Sinatra.new(base, &block) end
def app=(new_app); @app = new_app end

include WebMock::API

=begin
def file_upload_hash
  {:type => "image/jpeg",
   :tempfile => Rack::Test::UploadedFile.new(File.join('tests', 'files', 'rosemarys-baby.jpg'), "image/jpeg"),
   :name => "photo[file]",
   :filename=>"rosemarys-baby.jpg",
   :head=>"Content-Disposition: form-data; name=\"photo[file]\"; filename=\"rosemarys-baby.jpg\"\r\nContent-Type: image/jpeg\r\nContent-Length: 28333\r\n"}
end
=end
