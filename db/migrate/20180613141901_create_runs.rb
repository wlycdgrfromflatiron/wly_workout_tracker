class CreateRuns < ActiveRecord::Migration[5.2]
  def change
    create_table :runs do |t|
      t.integer :tens_of_miles
      t.integer :milliseconds
      t.integer :tens_of_incline_degrees, default: 0
      t.belongs_to :workout
    end
  end
end
