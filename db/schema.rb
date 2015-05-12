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

ActiveRecord::Schema.define(version: 20150508164836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string   "ref"
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "measures", force: :cascade do |t|
    t.string   "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offer_users", force: :cascade do |t|
    t.float    "quantity"
    t.float    "price"
    t.integer  "offer_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "status",     default: false
  end

  create_table "offers", force: :cascade do |t|
    t.string   "origins"
    t.string   "destination"
    t.string   "product"
    t.float    "volumen"
    t.boolean  "liquid_load"
    t.boolean  "container"
    t.boolean  "general_load"
    t.boolean  "load_compensation"
    t.string   "kind"
    t.string   "unit"
    t.float    "price"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "observations"
    t.integer  "status",              default: 1
    t.date     "service_start_date"
    t.date     "offer_finish_date"
    t.date     "offer_start_date"
    t.date     "service_finish_date"
  end

  create_table "products", force: :cascade do |t|
    t.string   "ref"
    t.string   "name"
    t.text     "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "name"
    t.string   "carrier"
    t.string   "landline"
    t.string   "cell_phone"
    t.boolean  "container"
    t.boolean  "liquid_charge"
    t.boolean  "dry_charge"
    t.string   "kind"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
