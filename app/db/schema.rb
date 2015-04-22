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

ActiveRecord::Schema.define(version: 20150422001600) do

  create_table "free_times", force: true do |t|
    t.string   "day"
    t.string   "timeSlot"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "free_times", ["user_id"], name: "index_free_times_on_user_id"

  create_table "groups", force: true do |t|
    t.string  "gname"
    t.integer "id1"
    t.integer "id2"
    t.integer "id3"
    t.integer "id4"
    t.integer "id5"
    t.integer "id6"
    t.integer "id7"
    t.integer "id8"
    t.integer "id9"
    t.integer "id10"
  end

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "major"
    t.string   "rank"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "major"
    t.string   "campus"
    t.integer  "group_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
