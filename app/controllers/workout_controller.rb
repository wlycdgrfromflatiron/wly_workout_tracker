class WorkoutController < ApplicationController
    get '/workouts' do
        redirect to '/' unless logged_in?

        erb :'/workouts/index'
    end

    post '/workouts' do

    end

    get '/workouts/new' do
        redirect to '/' unless logged_in?
        
        erb :'/workouts/new'
    end
end