class WorkoutController < ApplicationController
    get '/workouts' do
        redirect to '/' unless logged_in?

        workout_message = todays_workout_already_logged? ?
            "Good job logging today's workout. Come back tomorrow and keep the streak going." :
            "<a href='/workouts/new'>Log Today's Workout</a>"

        erb :'/workouts/index', locals: {todays_workout_message: workout_message}
    end

    post '/workouts' do
        redirect to '/' unless logged_in?
        redirect to '/workouts' if todays_workout_already_logged?

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
    end

    get '/workouts/new' do
        redirect to '/' unless logged_in?
        redirect to '/workouts' if todays_workout_already_logged?

        erb :'/workouts/new'
    end

    get '/workouts/:id' do
        "HELLO THIS IS THE DETAILS PAGE FOR #{Workout.find(params[:id]).date}'s workout"
    end

    def todays_workout_already_logged?
        user.workouts.detect {|w| w.date == Date.today}
    end
end