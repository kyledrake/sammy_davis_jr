Sammy Davis Junior - Asynchronous edition with EventMachine and Thin
==================

A simple, concise boilerplate for MVC/REST web development with Sinatra. Clocking in at 120 lines of code, it is the [HTML5 Boilerplate](http://html5boilerplate.com) of web development. Provides useful conventions without treating you like a child.

Sinatra was too basic for me, and Rails was too constraining. I wanted something that would provide a healthier balance between convention and creative expression. This boilerplate was the result. It is the ultimate expression of what I believe web development should be, philosophically collated through my decade of experience creating web applications. It encourages craftsmanship over conformity, only providing convention where it is truly useful, otherwise staying out of the way. Improvement without constraint.

Highlights
----------

* Asynchronous with [sinatra-synchrony](http://github.com/kyledrake/sinatra-synchrony)! Read more about how this works and why it's almost always good for you.
* Configuration is handled by environment.rb, which is under 40 lines of code! Getting a console is actually this simple: bundle exec irb -r environment.rb
* Uses [RVM](https://rvm.beginrescueend.com) to ensure Ruby 1.9.2 is used.
* Uses [Gemfile](http://gembundler.com/man/gemfile.5.html) to manage dependencies with [Bundler](http://gembundler.com). Provides some defaults I prefer, but you can quickly change them if you'd like (that's the beauty of this approach!).
* Integrated, ultra-simple testing boilerplate based on [Minitest::Spec](http://bfts.rubyforge.org/minitest/MiniTest/Spec.html), [Rack::Test](http://www.sinatrarb.com/testing.html) and [Wrong](http://github.com/sconover/wrong). I found RSpec to be too slow and complex, but you can use it here with a few easy modifications. Running tests is straightforward, you can run each *_spec.rb file separately, or run them all at once: bundle exec rake test
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
    $ bundle exec rackup -s thin

    For development, app reloads automatically:
    $ bundle exec shotgun -s thin -P public

    For production:
    $ bundle exec thin start -e production
    Look at the documentation for thin's command line. You can configure for multiple workers, etc..

That's it! Hit the app with your browser and you should see the stubbed index route.

Is this a Microframework or a Boilerplate?
------------------------------------------

This is a boilerplate, in the style of the [HTML5 Boilerplate](http://html5boilerplate.com). It's more of a glue that's designed to get you started in the right direction.

I am happy to hear suggestions for how to improve things or deal with unforeseen problems.. please file any requests with issues (or send pull requests!).

I've heard Ruby isn't very fast.
----------------------------------------

__You've heard wrong__. It's quite fast. And with the help of [EventMachine](http://rubyeventmachine.com) (via [sinatra-synchrony](http://github.com/kyledrake/sinatra-synchrony), [Thin](http://code.macournoyer.com/thin)) it also doesn't block on IO. Double this benchmark to get the top performance on my dual core if you configured a web proxy in front such as [Nginx](http://nginx.org) (which you should do anyways).

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


    Server Software:        thin
    Server Hostname:        127.0.0.1
    Server Port:            8080

    Document Path:          /
    Document Length:        1366 bytes

    Concurrency Level:      70
    Time taken for tests:   3.068 seconds
    Complete requests:      5000
    Failed requests:        0
    Write errors:           0
    Total transferred:      7550000 bytes
    HTML transferred:       6830000 bytes
    Requests per second:    1629.80 [#/sec] (mean)
    Time per request:       42.950 [ms] (mean)
    Time per request:       0.614 [ms] (mean, across all concurrent requests)
    Transfer rate:          2403.31 [Kbytes/sec] received

    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    1   0.5      1      11
    Processing:    22   42  14.7     34      77
    Waiting:       18   36  14.0     29      71
    Total:         25   42  14.7     35      77

    Percentage of the requests served within a certain time (ms)
      50%     35
      66%     36
      75%     40
      80%     67
      90%     68
      95%     70
      98%     71
      99%     73
     100%     77 (longest request)

Running this benchmark occasionally stalls out sockets in Mac OSX because of its buggy networking stack, but it runs perfectly in Linux. I highly recommend using Linux or Free/Net/Open BSD systems for production applications.