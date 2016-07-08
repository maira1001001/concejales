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

ActiveRecord::Schema.define(version: 20160703022713) do

  create_table "charges", force: :cascade do |t|
    t.integer  "district_id",        limit: 4
    t.integer  "political_party_id", limit: 4
    t.string   "start_date",         limit: 255
    t.string   "end_date",           limit: 255
    t.boolean  "in_function",                    default: true
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "councilor_id",       limit: 4
    t.integer  "section_id",         limit: 4
  end

  add_index "charges", ["councilor_id"], name: "index_charges_on_councilor_id", using: :btree
  add_index "charges", ["district_id"], name: "index_charges_on_district_id", using: :btree
  add_index "charges", ["political_party_id"], name: "index_charges_on_political_party_id", using: :btree
  add_index "charges", ["section_id"], name: "index_charges_on_section_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "website",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "participations", force: :cascade do |t|
    t.integer "role",       limit: 4
    t.integer "status",     limit: 4, default: 0
    t.integer "person_id",  limit: 4
    t.integer "charges_id", limit: 4
  end

  add_index "participations", ["charges_id"], name: "index_participations_on_charges_id", using: :btree
  add_index "participations", ["person_id"], name: "index_participations_on_person_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "name",                       limit: 255
    t.string   "last_name",                  limit: 255
    t.integer  "current_district_id",        limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "current_political_party_id", limit: 4
  end

  add_index "people", ["current_district_id"], name: "index_people_on_current_district_id", using: :btree
  add_index "people", ["current_political_party_id"], name: "index_people_on_current_political_party_id", using: :btree

  create_table "political_parties", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "project_files", force: :cascade do |t|
    t.string   "version",    limit: 255
    t.string   "attachment", limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "project_id", limit: 4
  end

  add_index "project_files", ["project_id"], name: "index_project_files_on_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.text     "description",  limit: 65535
    t.integer  "category",     limit: 4
    t.integer  "project_type", limit: 4
    t.string   "dossier",      limit: 255
    t.string   "dossier_url",  limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "roles",                  limit: 4
    t.integer  "status",                 limit: 4,   default: 0
    t.boolean  "force_password_change",              default: true
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "email",                  limit: 255, default: "",   null: false
    t.string   "encrypted_password",     limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,    null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.integer  "person_id",              limit: 4
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["person_id"], name: "index_users_on_person_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "charges", "participations", column: "councilor_id"
  add_foreign_key "charges", "sections"
  add_foreign_key "people", "districts", column: "current_district_id"
  add_foreign_key "people", "political_parties", column: "current_political_party_id"
  add_foreign_key "project_files", "projects"
  add_foreign_key "users", "people"
end
