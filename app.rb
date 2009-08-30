class App < Sinatra::Base
  set :sessions, true
  set :static, true
  set :root, File.expand_path(File.dirname(__FILE__))
  set :public, File.join(root, 'public')
  set :dump_errors, true
  
  helpers Sinatra::AppHelpers
  
  get '/' do
    erb :index
  end
  
end