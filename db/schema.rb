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

ActiveRecord::Schema.define(version: 20160731221751) do

  create_table "orders", force: :cascade do |t|
    t.text "name"
    t.text "phone"
    t.text "adress"
    t.text "order_list"
  end

  create_table "products", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.text "price"
    t.text "size"
    t.text "is_spicy"
    t.text "is_veg"
    t.text "is_best_offer"
    t.text "path_to_image"
  end

end
