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

ActiveRecord::Schema.define(version: 20170222203406) do

  create_table "access_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "access_token"
    t.integer  "user_id"
    t.integer  "client_id"
    t.datetime "validity_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["client_id"], name: "fk_rails_e00ee7aa6a", using: :btree
    t.index ["user_id"], name: "fk_rails_96fc070778", using: :btree
  end

  create_table "clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "oauth_id"
    t.string  "oauth_secret"
    t.string  "oauth_name"
    t.integer "user_id"
    t.index ["user_id"], name: "fk_rails_21c421fd41", using: :btree
  end

  create_table "pets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "race"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "fk_rails_0fa4bae6b1", using: :btree
  end

  create_table "refresh_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "refresh_token"
    t.integer  "user_id"
    t.integer  "client_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["client_id"], name: "fk_rails_413f467c0b", using: :btree
    t.index ["user_id"], name: "fk_rails_279e9a0091", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "firstname"
    t.string   "surname"
    t.string   "email"
    t.string   "hashpw"
    t.date     "birthday"
    t.string   "role"
    t.string   "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "access_tokens", "clients"
  add_foreign_key "access_tokens", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "pets", "users"
  add_foreign_key "refresh_tokens", "clients"
  add_foreign_key "refresh_tokens", "users"
end
