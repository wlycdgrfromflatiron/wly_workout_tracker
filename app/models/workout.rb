class Workout < ActiveRecord::Base
    validates :date, :user, presence: true
    belongs_to :user
    has_one :run
end