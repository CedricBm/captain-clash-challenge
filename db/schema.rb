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

ActiveRecord::Schema.define(version: 20170831080614) do

  create_table "fight_events", force: :cascade do |t|
    t.integer  "fight_id"
    t.string   "attacker_name"
    t.integer  "attack_type"
    t.integer  "attack_damage"
    t.string   "defender_name"
    t.integer  "defend_type"
    t.integer  "defender_health"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "fight_events", ["fight_id"], name: "index_fight_events_on_fight_id"

  create_table "fighters", force: :cascade do |t|
    t.integer  "hero_id"
    t.integer  "weapon_id"
    t.integer  "shield_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "hero_attributes"
  end

  add_index "fighters", ["hero_id"], name: "index_fighters_on_hero_id"
  add_index "fighters", ["shield_id"], name: "index_fighters_on_shield_id"
  add_index "fighters", ["weapon_id"], name: "index_fighters_on_weapon_id"

  create_table "fights", force: :cascade do |t|
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fights", ["loser_id"], name: "index_fights_on_loser_id"
  add_index "fights", ["winner_id"], name: "index_fights_on_winner_id"

  create_table "heros", force: :cascade do |t|
    t.string   "name"
    t.integer  "health"
    t.integer  "attack"
    t.integer  "speed",               default: 5
    t.integer  "dodge_rate",          default: 0
    t.integer  "critical_rate",       default: 0
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "power"
    t.integer  "rank"
  end

  create_table "shields", force: :cascade do |t|
    t.string   "name"
    t.integer  "armor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string   "name"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
