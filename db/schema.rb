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

ActiveRecord::Schema.define(version: 2018_06_16_133740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievement_notes", force: :cascade do |t|
    t.bigint "achievement_id"
    t.bigint "student_id"
    t.float "value", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["achievement_id"], name: "index_achievement_notes_on_achievement_id"
    t.index ["student_id"], name: "index_achievement_notes_on_student_id"
  end

  create_table "achievements", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.integer "position"
    t.integer "points"
    t.string "identifier"
    t.text "why"
    t.text "how"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "course_id"
    t.string "kind"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.bigint "promotion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "teach_project_id"
    t.date "starting_at"
    t.index ["promotion_id"], name: "index_courses_on_promotion_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.text "comment"
    t.text "relevant_content"
    t.text "content_to_add"
    t.text "content_to_remove"
    t.integer "quality"
    t.integer "technical_skills_acquired"
    t.integer "soft_skills_acquired"
    t.integer "knowledge_acquired"
    t.bigint "student_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_evaluations_on_course_id"
    t.index ["student_id"], name: "index_evaluations_on_student_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "course_id"
  end

  create_table "events_promotions", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "promotion_id", null: false
  end

  create_table "events_students", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "student_id", null: false
  end

  create_table "promotions", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "year"
  end

  create_table "students", id: :serial, force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "codeschool"
    t.string "codecademy"
    t.integer "promotion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "codeschool_data"
    t.text "codecademy_data"
    t.text "codecademy_badges"
    t.float "note"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "github_identifier"
    t.string "github_repository"
    t.string "heroku_app"
    t.boolean "admin", default: false
    t.string "pluralsight"
    t.text "pluralsight_data"
    t.string "pluralsight_uuid"
    t.text "pluralsight_data_completedcourses"
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  add_foreign_key "achievement_notes", "achievements"
  add_foreign_key "achievement_notes", "students"
  add_foreign_key "courses", "promotions"
  add_foreign_key "evaluations", "courses"
  add_foreign_key "evaluations", "students"
end
