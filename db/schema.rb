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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131125224538) do

  create_table "price_curves", :force => true do |t|
    t.string   "curve_name"
    t.string   "month"
    t.decimal  "open"
    t.decimal  "high"
    t.decimal  "low"
    t.decimal  "settle"
    t.decimal  "change"
    t.decimal  "bwave"
    t.integer  "vol"
    t.integer  "efp"
    t.integer  "efs"
    t.integer  "block"
    t.integer  "prev_vol"
    t.integer  "prev_open"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trades", :force => true do |t|
    t.integer  "trade_id"
    t.string   "counter_party"
    t.string   "trader"
    t.string   "mtm_curve"
    t.string   "buy_sell"
    t.decimal  "price"
    t.integer  "volume"
    t.string   "tenor_start"
    t.string   "tenor_end"
    t.string   "delivery_location"
    t.string   "instrument"
    t.string   "brokerage"
    t.string   "tags"
    t.string   "notes"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
