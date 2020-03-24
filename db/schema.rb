# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_24_032837) do

  create_table "assignments", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"employee\"", name: "index_assignments_on_employee"
    t.index "\"employee\", \"project\"", name: "index_assignments_on_employee_and_project"
    t.index "\"project\"", name: "index_assignments_on_project"
    t.index ["employee_id"], name: "index_assignments_on_employee_id"
    t.index ["project_id"], name: "index_assignments_on_project_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "telegram_id"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "salary"
    t.integer "working_hours"
    t.string "job"
    t.index ["name"], name: "index_employees_on_name"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_projects_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "assignments", "employees"
  add_foreign_key "assignments", "projects"
  add_foreign_key "employees", "users"
end
