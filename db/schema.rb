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

ActiveRecord::Schema.define(version: 20150423002216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "event_id", null: false
  end

  create_table "bottles", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "color",       limit: 255
    t.string   "grape",       limit: 255
    t.string   "vintage",     limit: 255
    t.string   "winery",      limit: 255
    t.string   "region",      limit: 255
    t.string   "alcohol",     limit: 255
    t.string   "price",       limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "event_title", limit: 255
    t.string   "event_venue", limit: 255
    t.date     "event_date"
    t.time     "duration"
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flights", id: false, force: :cascade do |t|
    t.integer "bottle_id", null: false
    t.integer "event_id",  null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bottle_id"
    t.integer  "my_rating"
    t.text     "comment"
    t.boolean  "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["bottle_id"], name: "index_reviews_on_bottle_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "table_regions", force: :cascade do |t|
    t.string "region"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",           limit: 255
    t.string   "fname",           limit: 255
    t.string   "lname",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "region",          limit: 255
    t.string   "avatar_url",      limit: 255
    t.integer  "age"
    t.text     "description"
    t.integer  "organizer_id"
  end

end
