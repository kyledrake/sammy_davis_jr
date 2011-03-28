class Controller < Sinatra::Base

  aget '/' do
    body erb(:index)
  end

end
