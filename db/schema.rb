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

ActiveRecord::Schema[7.0].define(version: 2023_05_23_225632) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "city_parkings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_credit_cards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "creditcards", force: :cascade do |t|
    t.string "name_card"
    t.string "number_card"
    t.date "exp_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "company_credit_card_id", null: false
    t.string "alias"
    t.boolean "is_active"
    t.index ["company_credit_card_id"], name: "index_creditcards_on_company_credit_card_id"
    t.index ["user_id"], name: "index_creditcards_on_user_id"
  end

  create_table "parking_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parkings", force: :cascade do |t|
    t.string "name"
    t.bigint "city_parking_id", null: false
    t.bigint "parking_type_id", null: false
    t.integer "rates"
    t.integer "spaces_available"
    t.boolean "availability"
    t.integer "tota_spaces_availble"
    t.string "address"
    t.string "fidelity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_parking_id"], name: "index_parkings_on_city_parking_id"
    t.index ["parking_type_id"], name: "index_parkings_on_parking_type_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "creditcards", "company_credit_cards"
  add_foreign_key "creditcards", "users"
  add_foreign_key "parkings", "city_parkings"
  add_foreign_key "parkings", "parking_types"
  add_foreign_key "users", "roles"
end
