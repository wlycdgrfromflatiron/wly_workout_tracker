class SessionController < ApplicationController
    get '/login' do
        if logged_in?
            redirect to "/users/#{session[:user_id]}"
        else
            erb :login
        end
    end

    post '/login' do

    end

    get '/logout' do
    end

    get '/signup' do
    end

    post '/signup' do
    end
end