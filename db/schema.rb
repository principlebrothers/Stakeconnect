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

ActiveRecord::Schema[7.0].define(version: 2023_03_06_012723) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrator_parent_teachers", force: :cascade do |t|
    t.bigint "parent_id", null: false
    t.bigint "teacher_id", null: false
    t.bigint "administrator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["administrator_id"], name: "index_administrator_parent_teachers_on_administrator_id"
    t.index ["parent_id"], name: "index_administrator_parent_teachers_on_parent_id"
    t.index ["teacher_id"], name: "index_administrator_parent_teachers_on_teacher_id"
  end

  create_table "administrators", force: :cascade do |t|
    t.string "name", null: false
    t.integer "number", null: false
    t.string "email", null: false
    t.string "image", null: false
    t.string "type", null: false
    t.string "encrypted_password", null: false
    t.integer "role"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.index ["jti"], name: "index_administrators_on_jti", unique: true
  end

  create_table "attendances", force: :cascade do |t|
    t.date "date"
    t.boolean "present"
    t.boolean "absent", default: false
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "course_reports", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "report_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_reports_on_course_id"
    t.index ["report_id"], name: "index_course_reports_on_report_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "semester"
    t.bigint "administrator_id", null: false
    t.bigint "grade_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["administrator_id"], name: "index_courses_on_administrator_id"
    t.index ["grade_id"], name: "index_courses_on_grade_id"
  end

  create_table "events", force: :cascade do |t|
    t.date "date", null: false
    t.string "location", null: false
    t.string "image"
    t.time "time"
    t.string "title", null: false
    t.text "description", null: false
    t.integer "semester", null: false
    t.bigint "administrator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["administrator_id"], name: "index_events_on_administrator_id"
  end

  create_table "grades", force: :cascade do |t|
    t.integer "grade_num"
    t.bigint "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_grades_on_teacher_id"
  end

  create_table "homeworks", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.text "question"
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_homeworks_on_course_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "name", null: false
    t.integer "number", null: false
    t.string "email", null: false
    t.string "image", null: false
    t.string "type", null: false
    t.string "encrypted_password", null: false
    t.integer "role"
    t.text "address", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.index ["email"], name: "index_parents_on_email", unique: true
    t.index ["jti"], name: "index_parents_on_jti", unique: true
    t.index ["number"], name: "index_parents_on_number", unique: true
  end

  create_table "reports", force: :cascade do |t|
    t.date "date"
    t.text "remark"
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_reports_on_student_id"
  end

  create_table "results", force: :cascade do |t|
    t.date "date"
    t.string "type"
    t.integer "score"
    t.bigint "course_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_results_on_course_id"
    t.index ["student_id"], name: "index_results_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name", null: false
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "administrator_id"
    t.bigint "parent_id"
    t.bigint "grade_id"
    t.index ["administrator_id"], name: "index_students_on_administrator_id"
    t.index ["grade_id"], name: "index_students_on_grade_id"
    t.index ["parent_id"], name: "index_students_on_parent_id"
  end

  create_table "teacher_courses", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_teacher_courses_on_course_id"
    t.index ["teacher_id"], name: "index_teacher_courses_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name", null: false
    t.integer "number", null: false
    t.string "email", null: false
    t.string "image", null: false
    t.string "type", null: false
    t.string "encrypted_password", null: false
    t.integer "role"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.index ["jti"], name: "index_teachers_on_jti", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.integer "number", null: false
    t.string "image", null: false
    t.string "type", null: false
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "administrator_parent_teachers", "administrators"
  add_foreign_key "administrator_parent_teachers", "parents"
  add_foreign_key "administrator_parent_teachers", "teachers"
  add_foreign_key "attendances", "students"
  add_foreign_key "course_reports", "courses"
  add_foreign_key "course_reports", "reports"
  add_foreign_key "courses", "administrators"
  add_foreign_key "courses", "grades"
  add_foreign_key "events", "administrators"
  add_foreign_key "grades", "teachers"
  add_foreign_key "homeworks", "courses"
  add_foreign_key "reports", "students"
  add_foreign_key "results", "courses"
  add_foreign_key "results", "students"
  add_foreign_key "students", "administrators"
  add_foreign_key "students", "grades"
  add_foreign_key "students", "parents"
  add_foreign_key "teacher_courses", "courses"
  add_foreign_key "teacher_courses", "teachers"
end
