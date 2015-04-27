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

ActiveRecord::Schema.define(version: 20150426092856) do

  create_table "cart_lists", force: true do |t|
    t.string   "sort"
    t.string   "name"
    t.float    "price"
    t.string   "unit"
    t.integer  "count"
    t.float    "sum"
    t.integer  "shop_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "barcode"
    t.integer  "freecount"
    t.integer  "free_count"
  end

  create_table "free_goods", force: true do |t|
    t.string   "barcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "free_lists", force: true do |t|
    t.string   "sort"
    t.string   "name"
    t.integer  "count"
    t.string   "barcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
  end

  create_table "shop_lists", force: true do |t|
    t.string   "barcode"
    t.string   "sort"
    t.string   "name"
    t.float    "price"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
