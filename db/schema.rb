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

ActiveRecord::Schema.define(version: 20180105224757) do

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "slug"
    t.string "image"
    t.integer "hero_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hero_id"], name: "index_abilities_on_hero_id"
    t.index [nil], name: "index_abilities_on_belongs_to"
  end

  create_table "heroes", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "slug"
    t.string "poster_image"
    t.string "description"
    t.string "type_of_hero"
    t.string "franchise"
    t.string "difficulty"
    t.string "thumb"
    t.boolean "live"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["franchise"], name: "index_heroes_on_franchise"
    t.index ["role_id"], name: "index_heroes_on_role_id"
  end

  create_table "heroics", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "slug"
    t.string "image"
    t.integer "hero_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hero_id"], name: "index_heroics_on_hero_id"
    t.index [nil], name: "index_heroics_on_belongs_to"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_roles_on_id"
  end

  create_table "stats", force: :cascade do |t|
    t.integer "damage", limit: 2, default: 0
    t.integer "utility", limit: 2, default: 0
    t.integer "survivability", limit: 2, default: 0
    t.integer "complexity", limit: 2, default: 0
    t.integer "hero_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hero_id"], name: "index_stats_on_hero_id"
    t.index ["id"], name: "index_stats_on_id"
  end

end
