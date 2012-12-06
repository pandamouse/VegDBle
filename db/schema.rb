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

ActiveRecord::Schema.define(:version => 20121129035519) do

  create_table "companions", :force => true do |t|
    t.integer  "r_plant_id"
    t.integer  "l_plant_id"
    t.integer  "companion_function_id"
    t.text     "description"
    t.boolean  "complimentary"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "images", :force => true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "image_file_file_name"
    t.string   "image_file_content_type"
    t.integer  "image_file_file_size"
    t.datetime "image_file_updated_at"
  end

  create_table "plants", :force => true do |t|
    t.string   "sci_name"
    t.string   "common_name"
    t.text     "description"
    t.integer  "parent_id"
    t.integer  "dimension"
    t.integer  "position_id"
    t.string   "image_url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sufferings", :force => true do |t|
    t.integer  "plant_id"
    t.integer  "sufferable_id"
    t.string   "sufferable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "sufferings", ["plant_id"], :name => "index_sufferings_on_plant_id"
  add_index "sufferings", ["sufferable_id", "sufferable_type"], :name => "index_sufferings_on_sufferable_id_and_sufferable_type"

end
