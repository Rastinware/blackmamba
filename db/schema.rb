# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140516135816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "loans", force: true do |t|
    t.integer  "personnel_id"
    t.integer  "month"
    t.integer  "year"
    t.string   "name"
    t.decimal  "installment"
    t.decimal  "remain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "loans", ["personnel_id"], name: "index_loans_on_personnel_id", using: :btree

  create_table "personnels", force: true do |t|
    t.string   "code"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "national_code"
    t.string   "father_name"
    t.string   "acc_no"
    t.string   "insurance_no"
    t.date     "birth_date"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "personnels", ["email"], name: "index_personnels_on_email", unique: true, using: :btree
  add_index "personnels", ["reset_password_token"], name: "index_personnels_on_reset_password_token", unique: true, using: :btree

  create_table "salaries", force: true do |t|
    t.integer  "personnel_id"
    t.integer  "month"
    t.integer  "year"
    t.float    "normal_work"
    t.float    "extra_work"
    t.float    "efficient_work"
    t.float    "off_work"
    t.decimal  "incomes_base_salary"
    t.decimal  "incomes_extra_work"
    t.decimal  "incomes_housing"
    t.decimal  "incomes_worker_subsidizes"
    t.decimal  "incomes_productivity_bonuses"
    t.decimal  "reductions_insurance"
    t.decimal  "reductions_tax"
    t.decimal  "reductions_current_month"
    t.decimal  "base_salary"
    t.decimal  "continuous_monthly_income"
    t.decimal  "aggregated_yearly_income"
    t.decimal  "aggregated_yearly_tax"
    t.decimal  "total_income"
    t.decimal  "total_reduction"
    t.decimal  "net_payment"
    t.boolean  "salaries",                     default: false, null: false
    t.boolean  "is_read",                      default: false, null: false
    t.boolean  "boolean",                      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "salaries", ["personnel_id"], name: "index_salaries_on_personnel_id", using: :btree

end
