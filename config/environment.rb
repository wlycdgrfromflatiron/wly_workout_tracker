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

["application", "account", "user", "workout"].each do |domain|
  require "./app/controllers/#{domain}_controller.rb"
end

