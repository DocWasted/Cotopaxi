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

ActiveRecord::Schema.define(:version => 20121113115244) do

  create_table "features", :force => true do |t|
    t.string   "name",                               :null => false
    t.text     "description",                        :null => false
    t.string   "state",       :default => "created"
    t.integer  "priority"
    t.integer  "difficulty"
    t.integer  "project_id",                         :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "sprint_id"
  end

  add_index "features", ["project_id"], :name => "index_features_on_project_id"

  create_table "projects", :force => true do |t|
    t.string   "name",                                   :null => false
    t.text     "description",                            :null => false
    t.string   "state",           :default => "created"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "sprint_duration", :default => 604800
  end

  create_table "roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["project_id"], :name => "index_roles_on_project_id"
  add_index "roles", ["user_id"], :name => "index_roles_on_user_id"

  create_table "sprints", :force => true do |t|
    t.integer  "duration"
    t.integer  "project_id",                         :null => false
    t.integer  "number",      :default => 1
    t.string   "state",       :default => "created"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.datetime "finish_date"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname",                                  :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "stakeholder",            :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
