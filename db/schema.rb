# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160901074744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "position"
    t.integer  "points"
    t.string   "identifier"
    t.text     "why"
    t.text     "how"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promotions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "codeschool"
    t.string   "codecademy"
    t.integer  "promotion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "codeschool_data"
    t.text     "codecademy_data"
    t.text     "codecademy_badges"
    t.float    "note"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "github_identifier"
    t.string   "github_repository"
    t.string   "heroku_app"
    t.boolean  "admin",                  default: false
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree

end
