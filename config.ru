# thin start -p 4567 -R config.ru
# thin start -p 4567 -e production -R config.ru
require 'environment'

map '/' do
  run Controller
end
