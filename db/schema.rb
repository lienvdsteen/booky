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

ActiveRecord::Schema.define(version: 20150321124459) do

  create_table "books", force: :cascade do |t|
    t.string   "isbn",             limit: 255
    t.integer  "year_published",   limit: 4
    t.string   "title",            limit: 4096
    t.string   "book_type",        limit: 255
    t.string   "language",         limit: 255
    t.string   "author_firstname", limit: 255
    t.string   "author_lastname",  limit: 255
    t.integer  "beid",             limit: 8
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "user_swiped_ratings", force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.string  "isbn",    limit: 255
    t.boolean "rating",  limit: 1
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid",          limit: 255
    t.string   "email",        limit: 255
    t.string   "username",     limit: 255
    t.string   "city",         limit: 255
    t.datetime "created_on"
    t.string   "gender",       limit: 255
    t.datetime "lastLogin"
    t.string   "status",       limit: 255
    t.datetime "birthdate"
    t.string   "token",        limit: 255
    t.string   "token_secret", limit: 255
  end

end
