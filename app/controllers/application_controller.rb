class ApplicationController < Sinatra::Base
  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch('SINATRA_SESSION_SECRET') { SecureRandom.hex(64) }
  end

  get '/' do
    erb :index
  end
end