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

ActiveRecord::Schema.define(:version => 20121109090640) do

  create_table "address_lists", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "addresses", :force => true do |t|
    t.integer  "address_list_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "organization"
    t.string   "country"
    t.text     "street_address1"
    t.text     "street_address2"
    t.string   "city"
    t.string   "prefecture"
    t.string   "postal_code"
    t.string   "phone"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
