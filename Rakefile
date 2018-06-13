ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc "An AR&db-aware Pry console. Better syntax highlighting than tux :)"
task :pry do
    Pry.start
end

# Type `rake -T` on your command line to see the available rake tasks.