class Run < ActiveRecord::Base
    validates :tens_of_miles, :milliseconds, :workout, presence: true
    belongs_to :workout
end