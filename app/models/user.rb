class User < ActiveRecord::Base
    has_secure_password
    validates :username, :password, presence: true
    has_many :workouts
end