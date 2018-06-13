class ApplicationController < Sinatra::Base
  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch('SINATRA_SESSION_SECRET') { SecureRandom.hex(64) }
  end

  get '/' do
    if logged_in?
      redirect to "/users/#{session[:user_id]}"
    else
      erb :index
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  def user
    User.find(session[:user_id])
  end
end