class WorkoutController < ApplicationController
    get '/workouts' do
        redirect to '/' unless logged_in?

        erb :'/workouts/index'
    end

    post '/workouts' do
        redirect to '/' unless logged_in?

        if (todays_workout_already_exists = user.workouts.detect {|w| w.date == Date.today})
            redirect to "workouts/#{todays_workout_already_exists.id}"
        end

        workout = Workout.create(
            date: Date.today,
            user: user
        )

        redirect to '/workouts'
        # make a workout with today's date
        # fail if a workout with this date already exists

        # make run, if all fields have been supplied

        # attach run to workout

        # redirect to workouts index, for now
        

        # make a run with 
        binding.pry

    end

    get '/workouts/new' do
        redirect to '/' unless logged_in?

        erb :'/workouts/new'
    end

    get '/workouts/:id' do
        "HELLO THIS IS THE DETAILS PAGE FOR #{Workout.find(params[:id]).date}'s workout"
    end
end