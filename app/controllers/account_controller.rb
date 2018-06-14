class AccountController < ApplicationController
    get '/login' do
        if logged_in?
            redirect to "/users/#{session[:user_id]}"
        else
            erb :'accounts/login'
        end
    end

    post '/login' do
    end

    get '/logout' do
    end

    get '/signup' do
        if logged_in?
            redirect to "/users/#{session[:user_id]}"
        else
            erb :'accounts/signup'
        end
    end

    post '/signup' do
    end
end