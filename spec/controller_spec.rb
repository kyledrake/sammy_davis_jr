require File.join File.expand_path(File.dirname(__FILE__)), 'environment.rb'

describe Controller do
  include Rack::Test::Methods
  def app; Controller end

  describe 'the index route' do
    it 'should load correctly' do
      get '/'
      expect_that { last_response.ok? }
      expect_that { last_response.body.length > 0 }
    end
  end
end
