ENV['RACK_ENV'] =  (ARGV && ARGV[0]) ? ARGV[0] : 'test'
raise 'Forget it.' if ENV['RACK_ENV'] == 'production'
require File.join(File.expand_path(File.dirname(__FILE__)), '..', 'environment.rb')
require 'test/unit'
Bundler.require :test
require File.join(File.expand_path(File.dirname(__FILE__)), 'fixtures.rb')

class Test::Unit::TestCase
  include Rack::Test::Methods
  def mock_app(base=Sinatra::Base, &block); @app = Sinatra.new(base, &block) end
  def app; @app end
  def app=(new_app); @app = new_app end
end

=begin
def file_upload_hash
  {:type => "image/jpeg",
   :tempfile => Rack::Test::UploadedFile.new(File.join('tests', 'files', 'rosemarys-baby.jpg'), "image/jpeg"),
   :name => "photo[file]",
   :filename=>"rosemarys-baby.jpg",
   :head=>"Content-Disposition: form-data; name=\"photo[file]\"; filename=\"rosemarys-baby.jpg\"\r\nContent-Type: image/jpeg\r\nContent-Length: 28333\r\n"}
end
=end
