# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_30_141411) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_feedbacks", force: :cascade do |t|
    t.string "title"
    t.text "contents"
    t.datetime "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_id"
    t.index ["profile_id"], name: "index_app_feedbacks_on_profile_id"
  end

  create_table "buddy_ups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "auto_match"
    t.integer "status"
    t.text "availability"
    t.integer "favourites"
    t.bigint "challenge_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_id"
    t.index ["challenge_id"], name: "index_buddy_ups_on_challenge_id"
    t.index ["profile_id"], name: "index_buddy_ups_on_profile_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "module"
    t.string "skill"
    t.string "name"
    t.string "url_fragment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.boolean "work_again", null: false
    t.bigint "buddy_up_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "message"
    t.bigint "profile_id"
    t.index ["buddy_up_id"], name: "index_feedbacks_on_buddy_up_id"
    t.index ["profile_id"], name: "index_feedbacks_on_profile_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "native"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_languages", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_profile_languages_on_language_id"
    t.index ["profile_id"], name: "index_profile_languages_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "bio"
    t.integer "batch"
    t.boolean "show_email", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "status", null: false
    t.text "message"
    t.bigint "buddy_up_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_id"
    t.index ["buddy_up_id"], name: "index_requests_on_buddy_up_id"
    t.index ["profile_id"], name: "index_requests_on_profile_id"
  end

  create_table "social_links", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_social_links_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "github_name"
    t.string "provider", limit: 50, default: "", null: false
    t.string "uid", limit: 50, default: "", null: false
    t.string "avatar_url"
    t.integer "status", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "app_feedbacks", "profiles"
  add_foreign_key "buddy_ups", "challenges"
  add_foreign_key "buddy_ups", "profiles"
  add_foreign_key "feedbacks", "buddy_ups"
  add_foreign_key "feedbacks", "profiles"
  add_foreign_key "profile_languages", "languages"
  add_foreign_key "profile_languages", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "requests", "buddy_ups"
  add_foreign_key "requests", "profiles"
  add_foreign_key "social_links", "users"
end
