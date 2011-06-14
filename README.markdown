Sammy Davis Junior - Asynchronous edition with EventMachine and Thin
==================

A simple, concise boilerplate for MVC/REST web development with Sinatra. Clocking in at 120 lines of code, it is the [Contest](http://blog.citrusbyte.com/2009/05/19/introducing-contest) of web development. Provides useful conventions without treating you like a child.

Sinatra was too basic for me, and Rails was too constraining. I wanted something that would provide a healthier balance between convention and creative expression. This boilerplate was the result. It is the ultimate expression of what I believe web development should be, philosophically collated through my decade of experience creating web applications. It encourages craftsmanship over conformity, only providing convention where it is truly useful, otherwise staying out of the way. Improvement without constraint.

Highlights
----------

* Configuration is handled by environment.rb, which is under 40 lines of code! Getting a console is actually this simple: bundle exec irb -r environment.rb
* Uses Gemfile to manage dependencies with Bundler. Provides some defaults I prefer (such as DataMapper for models), but you can quickly change this if you'd like (that's the beauty of it!).
* Integrated, ultra-simple testing boilerplate based on Test/Unit, Rack::Test and Contest. RSpec is too much! You shouldn't have to worry about your test framework. Running tests is straightforward: bundle exec ruby tests/controller\_tests.rb
* One file for routes, controller.rb. I subscribe to [Fat Models](http://weblog.jamisbuck.org/2006/10/18/skinny-controller-fat-model). For small to medium sized sites, you won't need to abstract routes into multiple files (but you can extend it to do this __very easily__ if you need to).
* UTF-8, out of the box.

Getting Started in One Minute
-----------------------------

1) Install Bundler:

    $ gem install bundler

2) Clone Sammy Davis Junior:

    $ git clone git@github.com:kyledrake/sammy_davis_jr.git

3) Modify Gemfile and environment.rb to your preference (or leave them alone).

4) Install dependancies with Bundler:

    $ bundle install

5) Start the server:

    For development:
    $ bundle exec shotgun
    
    For production:
    $ bundle exec rainbows -c rainbows_config.rb -E production

That's it! Hit the app with your browser and you should see the stubbed index route.

Is this a Microframework or a Boilerplate?
------------------------------------------

This is a boilerplate, in the style of the [HTML5 Boilerplate](http://html5boilerplate.com). It's more of a glue that's designed to get you started in the right direction.

I am happy to hear suggestions for how to improve things or deal with unforeseen problems.. please file any requests with issues (or send pull requests!).

I've heard Ruby isn't very fast.
----------------------------------------

__You've heard wrong__. "bundle exec rainbows -c rainbows\_config.rb -E production" on a quad-core i7 hackintosh, ruby 1.9.2p136. __4868 hits per second__:

    ~ $ ab -c 70 -n 5000 http://127.0.0.1:8080/
    This is ApacheBench, Version 2.3 <$Revision: 655654 $>
    Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
    Licensed to The Apache Software Foundation, http://www.apache.org/

    Benchmarking 127.0.0.1 (be patient)
    Completed 500 requests
    Completed 1000 requests
    Completed 1500 requests
    Completed 2000 requests
    Completed 2500 requests
    Completed 3000 requests
    Completed 3500 requests
    Completed 4000 requests
    Completed 4500 requests
    Completed 5000 requests
    Finished 5000 requests


    Server Software:        
    Server Hostname:        127.0.0.1
    Server Port:            8080

    Document Path:          /
    Document Length:        702 bytes

    Concurrency Level:      70
    Time taken for tests:   1.027 seconds
    Complete requests:      5000
    Failed requests:        0
    Write errors:           0
    Total transferred:      4925000 bytes
    HTML transferred:       3510000 bytes
    Requests per second:    4868.73 [#/sec] (mean)
    Time per request:       14.377 [ms] (mean)
    Time per request:       0.205 [ms] (mean, across all concurrent requests)
    Transfer rate:          4683.30 [Kbytes/sec] received

    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    0   0.2      0       4
    Processing:     1   14   3.7     13      41
    Waiting:        1   14   3.7     13      41
    Total:          3   14   3.6     13      41

    Percentage of the requests served within a certain time (ms)
      50%     13
      66%     15
      75%     16
      80%     17
      90%     19
      95%     22
      98%     24
      99%     25
     100%     41 (longest request)

Running this benchmark occasionally stalls out sockets in Mac OSX because of its buggy networking stack (and/or a bad configuration on my part), but it runs perfectly in Linux. I highly recommend using Linux or Free/Net/Open BSD systems for production applications.
