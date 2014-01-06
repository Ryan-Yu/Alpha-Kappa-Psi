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

ActiveRecord::Schema.define(version: 20140106005222) do

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
    t.string   "email",                   default: "", null: false
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "major"
    t.string   "pledge_class"
    t.string   "biography"
    t.string   "linkedin"
    t.string   "photograph_file_name"
    t.string   "photograph_content_type"
    t.integer  "photograph_file_size"
    t.datetime "photograph_updated_at"
    t.boolean  "display_on_index"
    t.string   "positions_held"
    t.string   "hometown"
  end

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
  end

  create_table "rush_events", force: true do |t|
    t.string   "event_name"
    t.string   "event_description"
    t.string   "location"
    t.datetime "event_time"
    t.string   "semester"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "rushees", ["email"], name: "index_rushees_on_email", unique: true

end
