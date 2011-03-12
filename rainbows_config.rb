worker_processes 4 # Set this to the number of CPU cores in your system
Rainbows! do
  case RUBY_VERSION[0..2]
    when '1.8' then use :ThreadSpawn
    when '1.9' then use :FiberSpawn
  end
  worker_connections 1024
end
