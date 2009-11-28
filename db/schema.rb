# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091128203157) do

  create_table "buildings", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.integer  "work_order_id"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.boolean  "reset_password"
    t.boolean  "ra"
    t.boolean  "rd"
    t.boolean  "administrator"
    t.boolean  "service_provider"
    t.string   "company"
    t.integer  "building_id"
    t.string   "coverage_area"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "work_orders", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.integer  "building_id"
    t.string   "room_number"
    t.string   "email"
    t.string   "location_of_problem"
    t.text     "problem"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
