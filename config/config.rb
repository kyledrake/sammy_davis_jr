ENV['RACK_ENV'] ||= 'development'
ENV['TZ'] = 'UTC'
DIR_ROOT = File.expand_path '..', File.dirname(__FILE__)
Encoding.default_internal = 'UTF-8'

require 'yaml'
require 'logger'
require 'bundler/setup'

Bundler.require
Bundler.require :development if ENV['RACK_ENV'] == 'development'

HTTPClientObject = HTTPClient.new

CONFIG = YAML.load_file(File.join(DIR_ROOT, 'config', 'config.yml'))[ENV['RACK_ENV']]

DB = Sequel.connect CONFIG['database']

%w[
  extension
  sinatra
  controller
  sequel
  model
  rack
  workers
].each {|f| require File.join(DIR_ROOT, 'lib', f) }

DB.loggers << Logger.new(STDOUT) if ENV['RACK_ENV'] == 'development'

if defined?(Pry)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end
