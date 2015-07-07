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

ActiveRecord::Schema.define(version: 20150707063719) do

  create_table "albums", force: true do |t|
    t.integer  "section_id"
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents", force: true do |t|
    t.integer  "album_id"
    t.string   "image"
    t.string   "title"
    t.text     "diary"
    t.string   "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identifications", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", force: true do |t|
    t.integer  "travel_id"
    t.string   "name"
    t.string   "date1"
    t.string   "date2"
    t.text     "description"
    t.string   "photo"
    t.string   "point"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.integer  "route_id"
    t.string   "name"
    t.string   "start"
    t.string   "end"
    t.string   "date1"
    t.string   "date2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travels", force: true do |t|
    t.integer  "user_id"
    t.integer  "travel_id"
    t.string   "name"
    t.text     "description"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "user_id"
    t.string   "password"
    t.string   "email"
    t.integer  "idtype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
