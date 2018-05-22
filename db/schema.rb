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

ActiveRecord::Schema.define(version: 2018_05_22_053207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.text "text"
    t.integer "position"
    t.integer "points"
    t.string "identifier", limit: 255
    t.text "why"
    t.text "how"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.bigint "promotion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["promotion_id"], name: "index_courses_on_promotion_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
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
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", id: :serial, force: :cascade do |t|
    t.string "firstname", limit: 255
    t.string "lastname", limit: 255
    t.string "codeschool", limit: 255
    t.string "codecademy", limit: 255
    t.integer "promotion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "codeschool_data"
    t.text "codecademy_data"
    t.text "codecademy_badges"
    t.float "note"
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.string "github_identifier", limit: 255
    t.string "github_repository", limit: 255
    t.string "heroku_app", limit: 255
    t.boolean "admin", default: false
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  add_foreign_key "courses", "promotions"
end
