require File.join 'tests', 'environment.rb'

class AppTests < Test::Unit::TestCase
  
  def app
    Controller
  end
  
  context 'the index' do
    test 'loads correctly' do
      get '/'
      assert last_response.ok?
      assert last_response.body.length > 0
    end
  end
  
end
