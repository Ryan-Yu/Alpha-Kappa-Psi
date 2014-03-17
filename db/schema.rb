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

ActiveRecord::Schema.define(version: 20140309234953) do

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
    t.string   "email",                               default: "",         null: false
    t.string   "encrypted_password",                  default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       default: 0,          null: false
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
    t.boolean  "display_on_index"
    t.string   "positions_held"
    t.string   "hometown"
    t.boolean  "approved",                            default: false,      null: false
    t.string   "eboard",                              default: ""
    t.boolean  "forem_admin",                         default: false
    t.string   "forem_state",                         default: "approved"
    t.boolean  "forem_auto_subscribe",                default: false
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

  create_table "awards", force: true do |t|
    t.integer  "year"
    t.string   "members"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "forem_categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "forem_categories", ["slug"], name: "index_forem_categories_on_slug", unique: true

  create_table "forem_forums", force: true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "category_id"
    t.integer "views_count", default: 0
    t.string  "slug"
  end

  add_index "forem_forums", ["slug"], name: "index_forem_forums_on_slug", unique: true

  create_table "forem_groups", force: true do |t|
    t.string "name"
  end

  add_index "forem_groups", ["name"], name: "index_forem_groups_on_name"

  create_table "forem_memberships", force: true do |t|
    t.integer "group_id"
    t.integer "member_id"
  end

  add_index "forem_memberships", ["group_id"], name: "index_forem_memberships_on_group_id"

  create_table "forem_moderator_groups", force: true do |t|
    t.integer "forum_id"
    t.integer "group_id"
  end

  add_index "forem_moderator_groups", ["forum_id"], name: "index_forem_moderator_groups_on_forum_id"

  create_table "forem_posts", force: true do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reply_to_id"
    t.string   "state",       default: "approved"
    t.boolean  "notified",    default: false
  end

  add_index "forem_posts", ["reply_to_id"], name: "index_forem_posts_on_reply_to_id"
  add_index "forem_posts", ["state"], name: "index_forem_posts_on_state"
  add_index "forem_posts", ["topic_id"], name: "index_forem_posts_on_topic_id"
  add_index "forem_posts", ["user_id"], name: "index_forem_posts_on_user_id"

  create_table "forem_subscriptions", force: true do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", force: true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "locked",       default: false,      null: false
    t.boolean  "pinned",       default: false
    t.boolean  "hidden",       default: false
    t.datetime "last_post_at"
    t.string   "state",        default: "approved"
    t.integer  "views_count",  default: 0
    t.string   "slug"
  end

  add_index "forem_topics", ["forum_id"], name: "index_forem_topics_on_forum_id"
  add_index "forem_topics", ["slug"], name: "index_forem_topics_on_slug", unique: true
  add_index "forem_topics", ["state"], name: "index_forem_topics_on_state"
  add_index "forem_topics", ["user_id"], name: "index_forem_topics_on_user_id"

  create_table "forem_views", force: true do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",             default: 0
    t.string   "viewable_type"
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
  end

  add_index "forem_views", ["updated_at"], name: "index_forem_views_on_updated_at"
  add_index "forem_views", ["user_id"], name: "index_forem_views_on_user_id"
  add_index "forem_views", ["viewable_id"], name: "index_forem_views_on_viewable_id"

  create_table "interview_slots", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "rushee_id"
    t.string   "interview_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interview_slots", ["rushee_id", "interview_type"], name: "index_interview_slots_on_rushee_id_and_interview_type", unique: true

  create_table "pledge_class_entries", force: true do |t|
    t.string   "classname"
    t.string   "semester"
    t.integer  "year"
    t.string   "members"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prep_files", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.integer  "recruitingcategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resourcefile_file_name"
    t.string   "resourcefile_content_type"
    t.integer  "resourcefile_file_size"
    t.datetime "resourcefile_updated_at"
    t.string   "submitted_by"
  end

  create_table "recruiting_categories", force: true do |t|
    t.string   "industry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recruiting_categories", ["industry"], name: "index_recruiting_categories_on_industry", unique: true

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
    t.text     "content",    limit: 255
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
    t.boolean  "eliminated",              default: false
  end

  add_index "rushees", ["email"], name: "index_rushees_on_email", unique: true

end
