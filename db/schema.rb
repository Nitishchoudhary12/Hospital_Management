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

ActiveRecord::Schema[7.0].define(version: 2024_11_16_020120) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hospital_staffs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "role"
    t.string "full_name"
    t.string "specialists"
    t.integer "total_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_hospital_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_hospital_staffs_on_reset_password_token", unique: true
  end

  create_table "patients", force: :cascade do |t|
    t.string "patient_name"
    t.string "address"
    t.integer "age"
    t.string "facing_issue"
    t.string "gender"
    t.string "phone_number"
    t.string "current_medications"
    t.string "status"
    t.datetime "booking_day"
    t.integer "booked_by"
    t.string "consulted_doctor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
