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

ActiveRecord::Schema.define(version: 20150918062650) do

  create_table "listings", force: :cascade do |t|
    t.string   "mls"
    t.string   "address"
    t.integer  "price"
    t.integer  "sqft"
    t.string   "gui"
    t.string   "target"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pitis", force: :cascade do |t|
    t.integer  "listing_id"
    t.integer  "price"
    t.integer  "down"
    t.float    "interest"
    t.integer  "maturity"
    t.float    "tax"
    t.integer  "insurance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pitis", ["listing_id"], name: "index_pitis_on_listing_id"

end
