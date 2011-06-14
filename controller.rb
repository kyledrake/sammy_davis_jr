class Controller < Sinatra::Base
  get '/' do
    erb :index
  end
end