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

ActiveRecord::Schema.define(version: 20160308211805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "event_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendances", ["event_id"], name: "i_attendances_on_event_id", using: :btree
  add_index "attendances", ["user_id", "event_id"], name: "ui_attendances", unique: true, using: :btree
  add_index "attendances", ["user_id"], name: "i_attendances_on_user_id", using: :btree

  create_table "bottles", force: :cascade do |t|
    t.integer  "winery_id",               null: false
    t.string   "name",        limit: 100, null: false
    t.string   "grape",       limit: 100, null: false
    t.integer  "vintage",                 null: false
    t.string   "label_image", limit: 256
    t.string   "more_url",    limit: 256
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "bottles", ["winery_id", "name", "grape", "vintage"], name: "ui_bottles", unique: true, using: :btree
  add_index "bottles", ["winery_id"], name: "i_bottles_on_winery_id", using: :btree

  create_table "bottles_events", force: :cascade do |t|
    t.integer  "bottle_id",  null: false
    t.integer  "event_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bottles_events", ["bottle_id", "event_id"], name: "ui_flights", unique: true, using: :btree
  add_index "bottles_events", ["bottle_id"], name: "i_flights_on_bottle_id", using: :btree
  add_index "bottles_events", ["event_id"], name: "i_flights_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "user_id",                 null: false
    t.string   "title",       limit: 100, null: false
    t.string   "venue",       limit: 100, null: false
    t.date     "date",                    null: false
    t.integer  "duration",                null: false
    t.string   "event_image", limit: 256
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "events", ["title", "date"], name: "ui_events", unique: true, using: :btree
  add_index "events", ["user_id"], name: "i_events_on_user_id", using: :btree
  add_index "events", ["venue", "date"], name: "ui2_events", unique: true, using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name",        limit: 63, null: false
    t.string   "location",    limit: 31, null: false
    t.text     "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "regions", ["name"], name: "ui_regions", unique: true, using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "bottle_id",  null: false
    t.integer  "my_rating",  null: false
    t.text     "comment"
    t.boolean  "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["bottle_id"], name: "i_reviews_on_bottle_id", using: :btree
  add_index "reviews", ["user_id", "bottle_id"], name: "ui_reviews", using: :btree
  add_index "reviews", ["user_id"], name: "i_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 100, null: false
    t.string   "fname",           limit: 31,  null: false
    t.string   "lname",           limit: 31,  null: false
    t.string   "password_digest", limit: 100
    t.string   "avatar_url",      limit: 100
    t.date     "birthday"
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["email"], name: "ui_users", unique: true, using: :btree

  create_table "wineries", force: :cascade do |t|
    t.integer  "region_id",              null: false
    t.string   "name",        limit: 63, null: false
    t.text     "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "wineries", ["name"], name: "ui_wineries", unique: true, using: :btree
  add_index "wineries", ["region_id"], name: "i_wineries_on_region_id", using: :btree

  add_foreign_key "attendances", "events", name: "fk_attendances_on_event_id", on_delete: :cascade
  add_foreign_key "attendances", "users", name: "fk_attendances_on_user_id", on_delete: :cascade
  add_foreign_key "bottles", "wineries", name: "fk_bottles_on_winery_id"
  add_foreign_key "bottles_events", "bottles", name: "fk_flights_on_bottle_id", on_delete: :cascade
  add_foreign_key "bottles_events", "events", name: "fk_flights_on_event_id", on_delete: :cascade
  add_foreign_key "events", "users", name: "fk_events_on_user_id"
  add_foreign_key "reviews", "bottles", name: "fk_reviews_on_bottle_id", on_delete: :cascade
  add_foreign_key "reviews", "users", name: "fk_reviews_on_user_id", on_delete: :cascade
  add_foreign_key "wineries", "regions", name: "fk_wineries_on_region_id"
end
