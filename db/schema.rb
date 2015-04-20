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

ActiveRecord::Schema.define(version: 20150420234457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bottles", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "grape"
    t.string   "vintage"
    t.string   "winery"
    t.string   "region"
    t.string   "alcohol"
    t.string   "price"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bottles_events", id: false, force: true do |t|
    t.integer "bottle_id", null: false
    t.integer "event_id",  null: false
  end

  create_table "events", force: true do |t|
    t.string   "event_title"
    t.string   "event_venue"
    t.date     "event_date"
    t.time     "duration"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_users", id: false, force: true do |t|
    t.integer "user_id",  null: false
    t.integer "event_id", null: false
  end

  create_table "user_reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "bottle_id"
    t.integer  "my_rating"
    t.text     "comment"
    t.boolean  "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_reviews", ["bottle_id"], name: "index_user_reviews_on_bottle_id", using: :btree
  add_index "user_reviews", ["user_id"], name: "index_user_reviews_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "fname"
    t.string   "lname"
    t.string   "password_digest"
    t.string   "region"
    t.string   "avatar_url"
    t.integer  "age"
    t.text     "description"
  end

end
