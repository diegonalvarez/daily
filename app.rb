require "bundler"
Bundler.setup
require 'sinatra'
require 'sinatra/base'
require 'sinatra/config_file'
require 'json'
require 'hipchat'
require 'data_mapper'

class App < Sinatra::Base

  register Sinatra::ConfigFile

  # Load core configuration file
  config_file 'config/app_config.yml'

  configure :development do
    DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/base.db")
  end

  configure :production do
    DataMapper.setup(:default, ENV['HEROKU_POSTGRESQL_RED_URL'])
  end

  use Rack::Auth::Basic, "Protected Area" do |username, password|
    username == settings.username && password == settings.password
  end

  run! if app_file == $0
end

require_relative 'models/init'
require_relative 'modules/init'
require_relative 'routes/init'
DataMapper.auto_upgrade!
DataMapper.finalize
