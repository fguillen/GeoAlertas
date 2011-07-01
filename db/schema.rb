# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 6) do

# Could not dump table "alerts" because of following StandardError
#   Unknown type 'sting' for column 'status'

  create_table "deliveries", :force => true do |t|
    t.integer  "alert_id", :null => false
    t.datetime "date",     :null => false
  end

  create_table "locations", :force => true do |t|
    t.integer  "user_id",                                    :null => false
    t.string   "latitude",  :limit => 20,                    :null => false
    t.string   "longitude", :limit => 20,                    :null => false
    t.string   "address"
    t.datetime "date",                                       :null => false
    t.boolean  "error",                   :default => false
  end

  create_table "pepes", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "phone",               :limit => 9,   :null => false
    t.string   "password_localizame", :limit => 40,  :null => false
    t.string   "password_sms",        :limit => 40,  :null => false
    t.string   "email",               :limit => 128, :null => false
    t.string   "password",            :limit => 40,  :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "role",                :limit => 20,  :null => false
  end

end
