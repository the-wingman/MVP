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

ActiveRecord::Schema.define(version: 20160214144004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gift_tags", force: :cascade do |t|
    t.integer  "gift_id",    null: false
    t.integer  "tag_id",     null: false
    t.float    "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "gift_tags", ["gift_id", "tag_id"], name: "index_gift_tags_on_gift_id_and_tag_id", unique: true, using: :btree
  add_index "gift_tags", ["gift_id"], name: "index_gift_tags_on_gift_id", using: :btree
  add_index "gift_tags", ["tag_id"], name: "index_gift_tags_on_tag_id", using: :btree

  create_table "gifts", force: :cascade do |t|
    t.string   "name",                                       null: false
    t.boolean  "experience",                                 null: false
    t.string   "url",                                        null: false
    t.string   "image_url"
    t.text     "description"
    t.text     "comment"
    t.decimal  "min_price",          precision: 8, scale: 2
    t.decimal  "max_price",          precision: 8, scale: 2
    t.boolean  "shipping_available"
    t.decimal  "shipping_price",     precision: 8, scale: 2
    t.integer  "shipping_time"
    t.integer  "brand_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "user_id"
  end

  add_index "gifts", ["brand_id"], name: "index_gifts_on_brand_id", using: :btree
  add_index "gifts", ["user_id"], name: "index_gifts_on_user_id", using: :btree

  create_table "profile_tags", force: :cascade do |t|
    t.integer  "profile_id",               null: false
    t.integer  "tag_id",                   null: false
    t.float    "value",      default: 1.0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "profile_tags", ["profile_id", "tag_id"], name: "index_profile_tags_on_profile_id_and_tag_id", unique: true, using: :btree
  add_index "profile_tags", ["profile_id"], name: "index_profile_tags_on_profile_id", using: :btree
  add_index "profile_tags", ["tag_id"], name: "index_profile_tags_on_tag_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",           null: false
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "gift_tags", "gifts"
  add_foreign_key "gift_tags", "tags"
  add_foreign_key "gifts", "brands"
  add_foreign_key "gifts", "users"
  add_foreign_key "profile_tags", "profiles"
  add_foreign_key "profile_tags", "tags"
  add_foreign_key "profiles", "users"
end
