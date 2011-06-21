class Controller < Sinatra::Base
  get '/' do
    erubis :index
  end
end