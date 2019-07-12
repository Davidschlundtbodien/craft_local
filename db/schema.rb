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

ActiveRecord::Schema.define(version: 2019_07_12_170945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beer_formats", force: :cascade do |t|
    t.integer "beer_id"
    t.integer "format_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.string "style"
    t.integer "ibu"
    t.integer "srm"
    t.text "description"
    t.string "glassware"
    t.string "image"
    t.integer "brewery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "abv", precision: 5, scale: 2
  end

  create_table "breweries", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "profile_img"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
  end

  create_table "event_beers", force: :cascade do |t|
    t.integer "event_id"
    t.integer "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "scheduled_date"
    t.string "location"
    t.text "content"
    t.string "image"
    t.integer "brewery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formats", force: :cascade do |t|
    t.string "name"
    t.string "unit_type"
    t.decimal "single_unit_volume", precision: 9, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pack"
    t.integer "case"
  end

end
