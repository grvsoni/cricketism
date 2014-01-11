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

ActiveRecord::Schema.define(version: 20131230080521) do

  create_table "cities", force: true do |t|
    t.integer  "country_id",            null: false
    t.integer  "dma_id",                null: false
    t.integer  "state_id"
    t.string   "name",       limit: 45, null: false
    t.float    "latitude",              null: false
    t.float    "longitude",             null: false
    t.string   "timezone",   limit: 10, null: false
    t.string   "county",     limit: 25
    t.string   "code",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "cities", ["name"], name: "index_cities_on_name", using: :btree

  create_table "clubs", force: true do |t|
    t.string   "name"
    t.string   "war_cry"
    t.string   "status"
    t.string   "city"
    t.string   "state"
    t.string   "country",           default: "India"
    t.boolean  "is_verified",       default: false
    t.boolean  "is_registered",     default: false
    t.date     "verification_date"
    t.date     "registration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "level_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "user_id"
  end

  create_table "countries", force: true do |t|
    t.string   "name",                 limit: 50, null: false
    t.string   "fips104",              limit: 2,  null: false
    t.string   "iso2",                 limit: 2,  null: false
    t.string   "iso3",                 limit: 3,  null: false
    t.string   "ison",                 limit: 4,  null: false
    t.string   "internet",             limit: 2,  null: false
    t.string   "capital",              limit: 25
    t.string   "map_reference",        limit: 50
    t.string   "nationality_singular", limit: 35
    t.string   "nationaiity_plural",   limit: 35
    t.string   "currency",             limit: 30
    t.string   "currency_code",        limit: 3
    t.integer  "population"
    t.string   "title",                limit: 50
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "levels", force: true do |t|
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "match_types", force: true do |t|
    t.string   "name"
    t.integer  "player_count"
    t.integer  "max_over_batting"
    t.integer  "max_run_batting"
    t.string   "max_over_bowling"
    t.integer  "innings"
    t.integer  "balls_per_over"
    t.boolean  "rebowl_noball"
    t.integer  "noball_runs"
    t.boolean  "dismiss_on_wicket"
    t.integer  "wicket_value"
    t.boolean  "last_man_bat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "players", force: true do |t|
    t.integer  "user_id"
    t.integer  "club_id"
    t.integer  "team_id"
    t.string   "batting_hand"
    t.string   "bowling_hand"
    t.string   "skill"
    t.string   "batting_style"
    t.string   "bowling_style"
    t.boolean  "is_wicketkeeper"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "dob"
    t.string   "street"
    t.float    "height"
    t.float    "weight"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "login_role", default: true
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "states", force: true do |t|
    t.integer  "country_id",            null: false
    t.string   "name",       limit: 45, null: false
    t.string   "code",       limit: 8,  null: false
    t.string   "adm1code",   limit: 4,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "club_id"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

end
