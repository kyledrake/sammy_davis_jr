class IndexController < Controller
  get '/?' do
    slim :index
  end
end