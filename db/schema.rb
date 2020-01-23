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

ActiveRecord::Schema.define(version: 2020_01_23_195655) do

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.float "lat"
    t.float "lon"
  end

  create_table "dish_orders", force: :cascade do |t|
    t.integer "order_id"
    t.integer "dish_id"
  end

  create_table "dish_tags", force: :cascade do |t|
    t.integer "dish_id"
    t.integer "tag_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name", null: false
    t.integer "restaurant_id"
    t.float "price"
    t.float "cost"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "orderer_id"
    t.integer "restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.float "lat"
    t.float "lon"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.datetime "date"
    t.integer "reviewer_id"
    t.integer "restaurant_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
  end

end
