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

ActiveRecord::Schema.define(version: 20140219115934) do

  create_table "customers", force: true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "location"
    t.integer  "postal"
    t.string   "street"
    t.string   "straatNr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers_and_playlists", force: true do |t|
    t.integer "customer_id"
    t.integer "playlist_id"
  end

  create_table "customers_devices", force: true do |t|
    t.integer "customer_id"
    t.integer "device_id"
  end

  create_table "customers_playlists", force: true do |t|
    t.integer "customer_id"
    t.integer "playlist_id"
  end

  create_table "customers_users", force: true do |t|
    t.integer "customer_id"
    t.integer "user_id"
  end

  create_table "data_files", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "serial"
    t.string   "name"
    t.integer  "height"
    t.integer  "width"
    t.integer  "top"
    t.integer  "left"
    t.string   "screentype"
    t.string   "os"
    t.string   "ip"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fileuploads", force: true do |t|
    t.string   "dbfile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  create_table "playlists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
