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

ActiveRecord::Schema.define(version: 20180323202118) do

  create_table "legacies", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.date "born_on"
    t.date "passed_on"
    t.string "country"
    t.string "state"
    t.string "county"
    t.string "city"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "memories", force: :cascade do |t|
    t.string "title"
    t.text "what_happened"
    t.integer "legacy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "country"
    t.string "state"
    t.string "county"
    t.boolean "admin"
    t.boolean "super"
    t.boolean "legacy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "remember_digest"
    t.boolean "moderator", default: false
    t.boolean "moderator2", default: false
    t.boolean "moderator3", default: false
    t.boolean "moderator5", default: false
    t.boolean "moderator10", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
