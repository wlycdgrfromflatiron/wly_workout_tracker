describe Run do
    def build_run(d, t, incline, workout)
        @run.tens_of_miles = @tens_of_miles if d
        @run.milliseconds = (30 + 16 * 60) * 1000 if t
        @run.tens_of_incline_degrees = 25 if incline
        @run.workout = @workout if workout
    end

    before do
        @tens_of_miles = 20

        @user = User.create!(
            username: "LeBron James",
            password: "0-4"
        )
        expect(@user).to be_an_instance_of(User)

        @workout = Workout.create!(
            date: Date.today,
            user: @user
        )
        expect(@workout).to be_an_instance_of(Workout)

        @run = Run.new
    end

    it 'can create new run with tens_of_miles, milliseconds, tens_of_incline_degrees, and workout' do
        build_run(true, true, true, true)

        expect(@run.save).to be true
    end

    it 'can create new run without tens_of_incline_degrees' do
        build_run(true, true, false, true)

        expect(@run.save).to be true
    end

    it 'can not create new run without tens_of_miles' do
        build_run(false, true, true, true)

        expect(@run.save).to be false
    end

    it 'can not create new run without milliseconds' do
        build_run(true, false, true, true)

        expect(@run.save).to be false
    end

    it 'can not create new run without workout' do
        build_run(true, true, true, false)

        expect(@run.save).to be false
    end
end