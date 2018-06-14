class UserController < ApplicationController
    get '/user' do
        redirect to '/' unless logged_in?

        @user = User.find(session[:user_id])

        "welcome, #{User.find(session[:user_id]).username}. the session[:user_id] value is #{session[:user_id]}."
    end
end