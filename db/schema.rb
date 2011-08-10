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

ActiveRecord::Schema.define(:version => 20110810094922) do

  create_table "applications", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interfacings", :force => true do |t|
    t.integer  "project_id"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pr_nb_users", :force => true do |t|
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pr_process_times", :force => true do |t|
    t.string   "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pr_project_types", :force => true do |t|
    t.string   "ptype"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_path"
  end

  create_table "pr_usage_freqs", :force => true do |t|
    t.string   "freq"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.string   "country"
    t.string   "overview"
    t.string   "skills"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.integer  "employer_id"
    t.string   "title"
    t.integer  "pr_project_type_id"
    t.integer  "pr_nb_user_id"
    t.integer  "pr_process_time_id"
    t.integer  "pr_usage_freq_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.integer  "fb_user_id"
    t.string   "email_hash"
  end

end
