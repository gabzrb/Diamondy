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

ActiveRecord::Schema.define(version: 2019_10_27_160601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "annonces", force: :cascade do |t|
    t.string "category"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_annonces_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.index ["product_id"], name: "index_contacts_on_product_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "jewels", force: :cascade do |t|
    t.string "category"
    t.string "state"
    t.string "brand"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_jewels_on_product_id"
  end

  create_table "product_attachments", force: :cascade do |t|
    t.string "photo"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_attachments_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.text "description"
    t.string "element"
    t.float "price"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "special_requests", force: :cascade do |t|
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "categorie"
    t.index ["product_id"], name: "index_special_requests_on_product_id"
  end

  create_table "stones", force: :cascade do |t|
    t.string "category"
    t.string "size"
    t.float "weight"
    t.string "color"
    t.string "purity"
    t.string "certificate"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "shape"
    t.string "symetry"
    t.string "polish"
    t.string "fluo"
    t.index ["product_id"], name: "index_stones_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "photo"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company_name"
    t.string "siret_no"
    t.text "services_description"
    t.boolean "newsletter"
    t.boolean "offers"
    t.boolean "admin", default: false
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "watches", force: :cascade do |t|
    t.string "state"
    t.string "brand"
    t.string "model"
    t.string "year"
    t.string "material"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_watches_on_product_id"
  end

  add_foreign_key "annonces", "users"
  add_foreign_key "contacts", "products"
  add_foreign_key "contacts", "users"
  add_foreign_key "jewels", "products"
  add_foreign_key "product_attachments", "products"
  add_foreign_key "products", "users"
  add_foreign_key "special_requests", "products"
  add_foreign_key "stones", "products"
  add_foreign_key "watches", "products"
end
