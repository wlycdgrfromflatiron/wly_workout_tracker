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

        if all_required_run_info_submitted?
            Run.create(
                tens_of_miles: (params[:run][:distance]).to_f * 10,
                milliseconds: run_milliseconds,
                tens_of_incline_degrees: params[:run][:incline] || 0,
                workout: workout 
            )
        end

        redirect to '/workouts'
    end

    get '/workouts/new' do
        redirect to '/' unless logged_in?
        redirect to '/workouts' if todays_workout_already_logged?

        erb :'/workouts/new'
    end

    get '/workouts/:id' do
        redirect to '/' unless logged_in?
        redirect to '/workouts' unless workout_belongs_to_user?

        @workout = Workout.find(params[:id])
        @run = @workout.run
        if (@run)
            @run_miles = @run.tens_of_miles / 10
            @run_minutes = ((@run.milliseconds / 1000) / 60).floor
            @run_seconds = (@run.milliseconds / 1000) % 60
            @run_incline = @run.tens_of_incline_degrees / 10
        end

        erb :'/workouts/show'
    end

    def todays_workout_already_logged?
        user.workouts.detect {|w| w.date == Date.today}
    end

    def all_required_run_info_submitted?
        !params[:run][:distance].empty? &&
        !params[:run][:minutes].empty? &&
        !params[:run][:seconds].empty?
    end

    def run_milliseconds
        (
            ((params[:run][:minutes]).to_i * 60) +
            (params[:run][:seconds]).to_i
        ) * 1000
    end

    def workout_belongs_to_user?
        # find_by returns nil, not an error, if record does not exist
        user.workouts.include?(Workout.find_by(id: params[:id]))
    end
end