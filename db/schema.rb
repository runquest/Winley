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

ActiveRecord::Schema.define(version: 20150427082000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "event_id", null: false
  end

  create_table "bottles", force: :cascade do |t|
    t.string   "name"
    t.string   "grape"
    t.integer  "vintage"
    t.string   "winery"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "label_image"
    t.integer  "year"
    t.string   "more_url"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "venue"
    t.date     "date"
    t.integer  "duration"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "event_image"
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
    t.string  "email"
    t.string  "fname"
    t.string  "lname"
    t.string  "password_digest"
    t.string  "avatar_url"
    t.date    "birthday"
    t.text    "description"
    t.integer "organizer_id"
  end

end
