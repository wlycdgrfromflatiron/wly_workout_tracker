ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/models/user.rb'
require './app/models/workout.rb'
require './app/models/run.rb'

require './app/controllers/application_controller.rb'
require './app/controllers/account_controller.rb'
require './app/controllers/user_controller.rb'