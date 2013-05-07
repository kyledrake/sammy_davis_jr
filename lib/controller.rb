class Controller < Sinatra::Base
  register Sinatra::Sprockets
  register Sinatra::ControllerHelpers
  register Sinatra::ViewHelpers
  register Sinatra::Flash

  configure do
    use Rack::Session::Cookie, key:          'website',
                               path:         '/',
                               expire_after: 31556926, # one year in seconds
                               secret:       CONFIG['session_secret']

    set :root, DIR_ROOT

    use Rack::TimeZoneHeader

    error     { slim :error }      if production?
    not_found { slim :not_found }  if production?
  end

  def render(engine, data, options = {}, locals = {}, &block)
    options.merge!(pretty: self.class.development?) if engine == :slim && options[:pretty].nil?
    super engine, data, options, locals, &block
  end
end

%w[
  index_controller
].require_each_from 'controllers'