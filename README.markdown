Sammy Davis Junior
==================

A simple, concise boilerplate for MVC/REST web development with Sinatra. Clocking in at 120 lines of code (including tests), it is the [Contest](http://blog.citrusbyte.com/2009/05/19/introducing-contest) of web development frameworks. Provides useful conventions without treating you like a child.

Sinatra was too basic for me, and Rails was too bloated. I wanted something that would provide a healthier balance between convention and creative expression. This boilerplate was the result. It is the ultimate expression of what I believe web development should be, philosophically collated through my decade of experience creating web applications. It encourages craftsmanship over conformity, only providing convention where it is truly useful, otherwise staying out of the way. Improvement without constraint.


Highlights
----------

* Configuration is handled by environment.rb, which is only 33 lines of code! Getting a console is actually this simple: bundle exec irb -r environment.rb
* Uses Gemfile to manage dependencies with Bundler. Provides some defaults I prefer (such as DataMapper for models), but you can quickly change this if you'd like (that's the beauty of it!).
* Integrated, ultra-simple testing boilerplate based on Test/Unit, Rack::Test and Contest. RSpec is too much! You shouldn't have to worry about your test framework. Running tests is straightforward: bundle exec ruby tests/controller\_tests.rb
* One file for routes, controller.rb. I subscribe to Fat Models. For small to medium sized sites, you won't need to abstract routes into multiple files (but you can extend it to do this __very easily__ if you need to).


Getting Started in One Minute
-----------------------------

1. Get it:

    $ git clone git@github.com:kyledrake/sammy_davis_jr.git

2. Modify Gemfile and environment.rb to your preference (or leave them alone).

3. Install dependancies with Bundler:

    $ bundle install

4. Copy to new folder (or git repository)

5. Start the server:

    $ bundle exec rainbows

6. That's it!


Is this a Microframework or a Boilerplate?
------------------------------------------

I feel this is more of a boilerplate. To me, it's because this reminds me more of projects like the [HTML5 Boilerplate](http://html5boilerplate.com) than it does of a microframework. It's more of a glue that's designed to get you started in the right direction.

I am happy to hear suggestions for how to improve things or deal with unforeseen problems.. please file any requests with issues (or send pull requests!).

