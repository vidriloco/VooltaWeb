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

ActiveRecord::Schema.define(version: 20140810002545) do

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

  create_table "pois", force: true do |t|
    t.integer  "poi_category_id"
    t.integer  "poi_kind_id"
    t.boolean  "listed"
    t.boolean  "sponsored"
    t.spatial  "coordinates",               limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.integer  "image_id"
    t.string   "details"
    t.string   "title"
    t.string   "mode"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published_on_lite_version",                                                          default: false
  end

  create_table "slides", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "url"
    t.integer  "image_id"
    t.boolean  "aligned_to_right"
    t.boolean  "main_slide"
    t.boolean  "contrasted"
    t.integer  "order"
    t.integer  "poi_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slides", ["order", "poi_id"], :name => "index_slides_on_order_and_poi_id"

  create_table "trip_resources", force: true do |t|
    t.string   "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.integer  "trip_resource_id"
    t.string   "distance"
    t.string   "title"
    t.string   "details"
    t.string   "complexity"
    t.integer  "background_image_id"
    t.integer  "cost",                                                                               default: 0
    t.boolean  "available"
    t.integer  "main_image_id"
    t.integer  "user_id"
    t.string   "lang"
    t.spatial  "origin_coordinate",         limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.spatial  "end_coordinate",            limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.text     "checksum"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "precompiled_json"
    t.boolean  "published_on_lite_version",                                                          default: false
    t.boolean  "staging",                                                                            default: false
  end

  create_table "users", force: true do |t|
    t.string   "full_name"
    t.string   "username"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
