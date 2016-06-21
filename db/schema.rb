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

ActiveRecord::Schema.define(version: 20160619010344) do

  create_table "collaborators", force: :cascade do |t|
    t.integer "status",  limit: 4
    t.integer "team_id", limit: 4
  end

  add_index "collaborators", ["team_id"], name: "index_collaborators_on_team_id", using: :btree

  create_table "councilors", force: :cascade do |t|
    t.string  "personal_website", limit: 255
    t.integer "team_id",          limit: 4
  end

  add_index "councilors", ["team_id"], name: "index_councilors_on_team_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "website",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "last_name",  limit: 255
    t.string   "photo",      limit: 255
    t.string   "type",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "political_parties", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "project_files", force: :cascade do |t|
    t.string   "version",    limit: 255
    t.string   "attachment", limit: 255
    t.string   "name",       limit: 255
    t.integer  "project_id", limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "project_files", ["project_id"], name: "fk_rails_c26fbba4b3", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.text     "description",  limit: 65535
    t.integer  "category",     limit: 4
    t.integer  "project_type", limit: 4
    t.string   "dossier",      limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "active", limit: 255
  end

  create_table "terms", force: :cascade do |t|
    t.integer  "councilor_id",       limit: 4
    t.integer  "district_id",        limit: 4
    t.integer  "political_party_id", limit: 4
    t.string   "start_date",         limit: 255
    t.string   "end_date",           limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "terms", ["councilor_id"], name: "index_terms_on_councilor_id", using: :btree
  add_index "terms", ["district_id"], name: "index_terms_on_district_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 255
    t.integer  "roles",                  limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.integer  "person_id",              limit: 4
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["person_id"], name: "index_users_on_person_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "collaborators", "teams"
  add_foreign_key "councilors", "teams"
  add_foreign_key "project_files", "projects"
  add_foreign_key "terms", "people", column: "councilor_id"
  add_foreign_key "users", "people"
end
