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


ActiveRecord::Schema[7.1].define(version: 2025_06_07_155106) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.bigint "experience_id", null: false
    t.integer "seats_available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experience_id"], name: "index_availabilities_on_experience_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "experience_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "availability_id"
    t.index ["availability_id"], name: "index_bookings_on_availability_id"
    t.index ["experience_id"], name: "index_bookings_on_experience_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "category"
    t.string "title"
    t.string "location"
    t.text "description"
    t.float "rating"
    t.float "price"
    t.integer "seats"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img_url"
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.float "rating"
    t.bigint "experience_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experience_id"], name: "index_reviews_on_experience_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "availabilities", "experiences"
  add_foreign_key "bookings", "availabilities"
  add_foreign_key "bookings", "experiences"
  add_foreign_key "bookings", "users"
  add_foreign_key "experiences", "users"
  add_foreign_key "reviews", "experiences"
  add_foreign_key "reviews", "users"
end
