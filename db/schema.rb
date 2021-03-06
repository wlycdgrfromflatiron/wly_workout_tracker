# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_06_13_141901) do

  create_table "runs", force: :cascade do |t|
    t.integer "tens_of_miles"
    t.integer "milliseconds"
    t.integer "tens_of_incline_degrees", default: 0
    t.integer "workout_id"
    t.index ["workout_id"], name: "index_runs_on_workout_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

  create_table "workouts", force: :cascade do |t|
    t.date "date"
    t.integer "user_id"
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

end
