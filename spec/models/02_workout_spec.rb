#can create new workout with date and user
#can not create new workout without date
#can not create new workout without user

describe Workout do
    def build_workout(date, user)
        @workout.date = Date.today if date
        @workout.user = @user if user
    end

    before do
        @user = User.create(
            username: "Bill Gates",
            password: "taDA"
        )
        expect(User.find_by(username: "Bill Gates").authenticate("taDA").username).to eq("Bill Gates")

        @workout = Workout.new
    end

    it 'can persist new workout with date and user' do
        build_workout(true, true)
        
        @workout.save

        expect(Workout.find_by(date: Date.today).user).to eq(@user)
    end

    it 'can not persist new workout without date' do
        build_workout(false, true)

        expect(@workout.save).to be false
    end

    it 'can not persist new workout without user' do
        build_workout(true, false)
        
        expect(@workout.save).to be false
    end
end