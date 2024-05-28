# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_28_081016) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  
  create_table "carts", force: :cascade do |t|
    t.datetime "startedate"
    t.float "total_price"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end
  
  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.datetime "startedate"
    t.float "total_price", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end
  
  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.string "subtitle"
    t.text "description"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  
  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "billing_address"
    t.string "delivery_address"
    t.string "password_digest"
    t.boolean "isadmin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  
  create_table "cart_products", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "product_id", null: false
    t.float "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_products_on_cart_id"
    t.index ["product_id"], name: "index_cart_products_on_product_id"
  end
  
    create_table "order_products", force: :cascade do |t|
      t.bigint "order_id", null: false
      t.bigint "product_id", null: false
      t.float "quantity"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["order_id"], name: "index_order_products_on_order_id"
      t.index ["product_id"], name: "index_order_products_on_product_id"
    end
  
  add_foreign_key "cart_products", "carts"
  add_foreign_key "cart_products", "products"
  add_foreign_key "carts", "users"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "users"
end
