class UserController < ApplicationController
    get '/user' do
        redirect to '/' unless logged_in?

        @user = User.find(session[:user_id])

        erb :user
    end
end