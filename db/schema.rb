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

ActiveRecord::Schema.define(version: 20200313154234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "nit"
    t.string "phone"
    t.string "address"
    t.string "site_web"
    t.string "email"
    t.text "description"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "code"
    t.string "name_es"
    t.string "name_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disclaimer_quiz_defaults", force: :cascade do |t|
    t.bigint "disclaimer_id"
    t.bigint "quiz_default_id"
    t.string "response_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disclaimer_id"], name: "index_disclaimer_quiz_defaults_on_disclaimer_id"
    t.index ["quiz_default_id"], name: "index_disclaimer_quiz_defaults_on_quiz_default_id"
  end

  create_table "disclaimers", force: :cascade do |t|
    t.bigint "employee_id"
    t.bigint "city_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.bigint "creator_id"
    t.bigint "business_id"
    t.boolean "aceepted", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_disclaimers_on_business_id"
    t.index ["city_id"], name: "index_disclaimers_on_city_id"
    t.index ["creator_id"], name: "index_disclaimers_on_creator_id"
    t.index ["employee_id"], name: "index_disclaimers_on_employee_id"
  end

  create_table "payroll_discounts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "value_discount"
    t.string "month_discount"
    t.text "concept"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payroll_discounts_on_user_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "description"
    t.boolean "apply"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions_rols", id: false, force: :cascade do |t|
    t.bigint "permission_id"
    t.bigint "rol_id", null: false
    t.bigint "rols_id"
    t.index ["permission_id"], name: "index_permissions_rols_on_permission_id"
    t.index ["rols_id"], name: "index_permissions_rols_on_rols_id"
  end

  create_table "permissions_users", id: false, force: :cascade do |t|
    t.bigint "permission_id"
    t.bigint "user_id"
    t.index ["permission_id"], name: "index_permissions_users_on_permission_id"
    t.index ["user_id"], name: "index_permissions_users_on_user_id"
  end

  create_table "quiz_defaults", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "disclaimer_id"
    t.string "content"
    t.text "response_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disclaimer_id"], name: "index_quizzes_on_disclaimer_id"
  end

  create_table "rols", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "status"
    t.string "documentation"
    t.string "name"
    t.date "date_initiated"
    t.string "analytical_account"
    t.string "position"
    t.string "sex"
    t.date "date_birth"
    t.date "date_finality"
    t.string "salary"
    t.string "variable_salary"
    t.string "constitutive_compensation"
    t.string "constitutive_not_compensation"
    t.string "contract"
    t.string "address"
    t.string "neighborhood"
    t.string "phone"
    t.string "marital_status"
    t.string "profession"
    t.string "eps"
    t.string "afp"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "rol_id"
    t.bigint "business_id"
    t.index ["business_id"], name: "index_users_on_business_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["rol_id"], name: "index_users_on_rol_id"
  end

  create_table "vacations", force: :cascade do |t|
    t.bigint "user_id"
    t.date "initial_date_first_period"
    t.date "finality_date_first_period"
    t.date "initial_date_second_period"
    t.date "finality_date_second_period"
    t.string "days_paid"
    t.date "initial_date_first_pay"
    t.date "finality_date_first_pay"
    t.text "observations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vacations_on_user_id"
  end

  add_foreign_key "disclaimer_quiz_defaults", "disclaimers"
  add_foreign_key "disclaimer_quiz_defaults", "quiz_defaults"
  add_foreign_key "disclaimers", "businesses"
  add_foreign_key "disclaimers", "cities"
  add_foreign_key "disclaimers", "users", column: "creator_id"
  add_foreign_key "disclaimers", "users", column: "employee_id"
  add_foreign_key "permissions_rols", "permissions"
  add_foreign_key "permissions_rols", "rols", column: "rols_id"
  add_foreign_key "permissions_users", "permissions"
  add_foreign_key "permissions_users", "users"
  add_foreign_key "quizzes", "disclaimers"
  add_foreign_key "users", "businesses"
  add_foreign_key "users", "rols"
  add_foreign_key "vacations", "users"
end
