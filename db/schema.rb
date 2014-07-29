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

ActiveRecord::Schema.define(version: 20140712112004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contents", force: true do |t|
    t.integer  "order"
    t.string   "kind"
    t.text     "content"
    t.string   "title"
    t.string   "subtitle"
    t.integer  "image_id"
    t.string   "details"
    t.boolean  "full_width"
    t.string   "caption"
    t.string   "table_title"
    t.text     "html_string"
    t.float    "image_height",     default: 200.0
    t.integer  "contentable_id"
    t.string   "contentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contents", ["order", "contentable_id", "contentable_type"], :name => "index_contents_on_order_and_contentable_id_and_contentable_type", :unique => true

  create_table "images", force: true do |t|
    t.string   "url"
    t.string   "name"
    t.string   "image_type"
    t.string   "attribution_url"
    t.string   "attribution_info"
    t.text     "checksum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["url"], :name => "index_images_on_url", :unique => true

  create_table "landings", force: true do |t|
    t.integer  "user_id"
    t.integer  "image_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "path_trips", id: false, force: true do |t|
    t.integer "path_id"
    t.integer "trip_id"
  end

  create_table "paths", force: true do |t|
    t.integer  "thickness"
    t.string   "color"
    t.text     "coordinates_vector"
    t.string   "name"
    t.string   "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poi_categories", force: true do |t|
    t.string   "content"
    t.string   "keyword"
    t.string   "lang"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poi_kinds", force: true do |t|
    t.string   "content"
    t.string   "keyword"
    t.string   "lang"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poi_trips", id: false, force: true do |t|
    t.integer "poi_id"
    t.integer "trip_id"
  end

