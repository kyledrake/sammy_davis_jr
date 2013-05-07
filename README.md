Sammy Davis Junior
==================

A simple, concise boilerplate for web development with Sinatra. Provides useful conventions without treating you like a child.

Sinatra was too basic for me, and Rails was too constraining. I wanted something that would provide a healthier balance between convention and creative expression. This boilerplate was the result. It is the ultimate expression of what I believe web development should be, philosophically collated through my decade of experience creating web applications. It encourages craftsmanship over conformity, only providing convention where it is truly useful, otherwise staying out of the way. Improvement without constraint.

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
    $ bundle exec rackup

    For development, app reloads automatically:
    $ bundle exec shotgun -P public

    For production:
    $ bundle exec rainbows -c config/rainbows.rb -e production

That's it! Hit the app with your browser and you should see the stubbed index route.

Is this a Microframework or a Boilerplate?
------------------------------------------

This is a boilerplate, in the style of the [HTML5 Boilerplate](http://html5boilerplate.com). It's more of a glue that's designed to get you started in the right direction.

I am happy to hear suggestions for how to improve things or deal with unforeseen problems.. please file any requests with issues (or send pull requests!).