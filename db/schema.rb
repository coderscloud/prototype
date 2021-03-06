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

ActiveRecord::Schema.define(:version => 20111113150618) do

  create_table "actions", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.integer  "action_type", :null => false
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "status"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "developments", :force => true do |t|
    t.integer  "project_id"
    t.integer  "prog_lang_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interfacings", :force => true do |t|
    t.integer  "project_id"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "milestones", :force => true do |t|
    t.integer  "project_id"
    t.string   "date"
    t.string   "name"
    t.string   "status"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", :force => true do |t|
    t.integer  "user_id",                              :null => false
    t.integer  "notification_type",                    :null => false
    t.integer  "target_id",                            :null => false
    t.string   "target_type",                          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_read",           :default => false
  end

  add_index "notifications", ["target_id", "target_type"], :name => "index_notifications_on_target_id_and_target_type"
  add_index "notifications", ["user_id"], :name => "index_notifications_on_user_id"

  create_table "offers", :force => true do |t|
    t.integer  "project_id"
    t.integer  "submitter_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "nb_days"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount"
  end

  create_table "pr_arches", :force => true do |t|
    t.string   "arch"
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

  create_table "prog_langs", :force => true do |t|
    t.string   "name"
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
    t.text     "objective"
    t.integer  "pr_arch_id"
    t.string   "func_skills"
    t.datetime "start_date"
    t.datetime "deliv_date"
    t.integer  "estimated_load"
    t.string   "specfile"
    t.integer  "status"
    t.integer  "chosen_offer_id"
  end

  create_table "specfiles", :force => true do |t|
    t.integer  "project_id"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.integer  "project_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "nb_days"
    t.string   "name"
    t.string   "status"
    t.integer  "progress"
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
    t.integer  "user_type"
  end

end
