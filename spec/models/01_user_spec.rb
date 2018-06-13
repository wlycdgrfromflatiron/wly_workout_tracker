#can create new @user with @username and password
#can not create new @user without @username
#can not create new @user without password
#password is hashed, not stored in plain text

describe @user do
    def build_user(username, password)
        @user.username = "Roger Aisles" if username
        @user.password = "RA1" if password
    end

    before do
        @user = User.new
    end

    it 'can persist new user with username and password' do
        build_user(true, true)
        @user.save

        expect(User.find_by(username: "Roger Aisles").authenticate("RA1").username).to eq("Roger Aisles")
    end

    it 'can not persist new user without username' do
        build_user(false, true)

        expect(@user.save).to be false
    end

    it 'can not persist new user without password' do
        build_user(true, false)
        
        expect(@user.save).to be false
    end
    
    it 'user passwords are stored in hashcrypted form, not in plain text' do
        build_user(true, true)

        @user.save

        expect(User.find_by(username: "Roger Aisles").password).to be_nil
        expect(User.find_by(username: "Roger Aisles").password_digest).not_to be_nil 
        expect(User.find_by(username: "Roger Aisles").password_digest).not_to eql("RA1")
    end
end