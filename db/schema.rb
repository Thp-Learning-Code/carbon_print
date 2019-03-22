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

ActiveRecord::Schema.define(version: 2019_03_21_082742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.bigint "ratio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ratio_id"], name: "index_brands_on_ratio_id"
  end

  create_table "footprints", force: :cascade do |t|
    t.string "delivery_address"
    t.integer "zip_code"
    t.string "town"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.decimal "result"
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_footprints_on_product_id"
    t.index ["user_id"], name: "index_footprints_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.text "title"
    t.decimal "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "type_id"
    t.bigint "brand_id"
    t.bigint "warehouse_id"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["type_id"], name: "index_products_on_type_id"
    t.index ["warehouse_id"], name: "index_products_on_warehouse_id"
  end

  create_table "ratios", force: :cascade do |t|
    t.decimal "carbon_print_for_brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.bigint "value_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["value_id"], name: "index_types_on_value_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.integer "zip_code"
    t.string "town"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.float "latitude"
    t.float "longitude"
    t.string "country"
    t.boolean "is_admin", default: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "values", force: :cascade do |t|
    t.decimal "carbon_print"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "country"
    t.integer "zip_code"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "footprints", "products"
  add_foreign_key "footprints", "users"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "types"
  add_foreign_key "products", "warehouses"
end
p