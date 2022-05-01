# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_28_052126) do
  create_table "courses", force: :cascade do |t|
    t.string "subject"
    t.string "catalognumber"
    t.string "coursetitle"
    t.text "coursedescription"
    t.string "campus"
    t.string "day"
    t.string "time"
    t.string "instructors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "graders", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "classes", default: "--- []\n"
    t.text "available_times", default: "--- []\n"
    t.integer "recommendation_id"
    t.integer "user_id", null: false
    t.integer "section_id"
    t.index ["recommendation_id"], name: "index_graders_on_recommendation_id"
    t.index ["section_id"], name: "index_graders_on_section_id"
    t.index ["user_id"], name: "index_graders_on_user_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "student_firstname"
    t.string "student_lastname"
    t.string "student_email"
    t.string "course_index"
    t.string "course_section"
    t.text "reasons"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "number"
    t.string "mode"
    t.string "status"
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "graders_needed"
    t.integer "num_graders"
    t.string "start_time"
    t.string "end_time"
    t.index ["course_id"], name: "index_sections_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "reviewed"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "graders", "recommendations"
  add_foreign_key "graders", "sections"
  add_foreign_key "graders", "users"
  add_foreign_key "sections", "courses"
end
