class WorkoutController < ApplicationController
    get '/workouts' do
        redirect to '/' unless logged_in?
        
        erb :'/workouts/index'
    end
end