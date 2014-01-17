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

ActiveRecord::Schema.define(version: 20140116103549) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "actives", force: true do |t|
    t.string   "email",                               default: "",    null: false
    t.string   "encrypted_password",                  default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "major"
    t.string   "pledge_class"
    t.text     "biography",               limit: 255
    t.string   "linkedin"
    t.string   "photograph_file_name"
    t.string   "photograph_content_type"
    t.integer  "photograph_file_size"
    t.datetime "photograph_updated_at"
    t.boolean  "display_on_index",                    default: false
    t.string   "positions_held"
    t.string   "hometown"
    t.boolean  "approved",                            default: false, null: false
    t.string   "eboard",                              default: ""
  end

  add_index "actives", ["approved"], name: "index_actives_on_approved"
  add_index "actives", ["email"], name: "index_actives_on_email", unique: true
  add_index "actives", ["reset_password_token"], name: "index_actives_on_reset_password_token", unique: true

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "career_entries", force: true do |t|
    t.string   "name"
    t.string   "company"
    t.string   "group"
    t.integer  "year"
    t.string   "fullintern"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "job_category"
    t.integer  "active_id"
  end

  create_table "pledge_class_entries", force: true do |t|
    t.string   "classname"
    t.string   "semester"
    t.integer  "year"
    t.string   "members"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rush_applications", force: true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "zip_code"
    t.string   "grade"
    t.string   "first_major"
    t.decimal  "first_major_gpa",                                precision: 3, scale: 2
    t.string   "second_major"
    t.decimal  "second_major_gpa",                               precision: 3, scale: 2
    t.string   "third_major"
    t.decimal  "third_major_gpa",                                precision: 3, scale: 2
    t.string   "minor"
    t.decimal  "cumulative_gpa",                                 precision: 3, scale: 2
    t.boolean  "intended_haas"
    t.text     "academic_schedule",                  limit: 255
    t.text     "extracurricular_info",               limit: 255
    t.string   "cover_letter_file_name"
    t.string   "cover_letter_content_type"
    t.integer  "cover_letter_file_size"
    t.datetime "cover_letter_updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.string   "transcript_file_name"
    t.string   "transcript_content_type"
    t.integer  "transcript_file_size"
    t.datetime "transcript_updated_at"
    t.string   "additional_transcript_file_name"
    t.string   "additional_transcript_content_type"
    t.integer  "additional_transcript_file_size"
    t.datetime "additional_transcript_updated_at"
    t.string   "photograph_file_name"
    t.string   "photograph_content_type"
    t.integer  "photograph_file_size"
    t.datetime "photograph_updated_at"
    t.string   "found_through"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rushee_id"
  end

  add_index "rush_applications", ["email"], name: "index_rush_applications_on_email", unique: true
  add_index "rush_applications", ["rushee_id"], name: "index_rush_applications_on_rushee_id", unique: true

  create_table "rush_events", force: true do |t|
    t.string   "event_name"
    t.text     "event_description", limit: 255
    t.string   "location"
    t.datetime "event_time"
    t.string   "semester"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rush_flyers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "front_file_name"
    t.string   "front_content_type"
    t.integer  "front_file_size"
    t.datetime "front_updated_at"
  end

  create_table "rusheeposts", force: true do |t|
    t.string   "content"
    t.integer  "active_id"
    t.integer  "rushee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rusheeposts", ["rushee_id", "created_at"], name: "index_rusheeposts_on_rushee_id_and_created_at"

  create_table "rushees", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "grade"
    t.string   "major"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photograph_file_name"
    t.string   "photograph_content_type"
    t.integer  "photograph_file_size"
    t.datetime "photograph_updated_at"
    t.string   "password_digest"
  end

  add_index "rushees", ["email"], name: "index_rushees_on_email", unique: true

end
