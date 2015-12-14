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

ActiveRecord::Schema.define(version: 20151129172618) do

  create_table "classroom_students", force: :cascade do |t|
    t.integer  "classroom_id", limit: 4
    t.integer  "student_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "classroom_students", ["classroom_id"], name: "index_classroom_students_on_classroom_id", using: :btree
  add_index "classroom_students", ["student_id"], name: "index_classroom_students_on_student_id", using: :btree

  create_table "classrooms", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "subject_id",  limit: 4
    t.integer  "lecturer_id", limit: 4
    t.string   "location",    limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "classrooms", ["lecturer_id"], name: "index_classrooms_on_lecturer_id", using: :btree
  add_index "classrooms", ["subject_id"], name: "index_classrooms_on_subject_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.integer  "course_id",  limit: 4
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "enrollments", ["course_id"], name: "index_enrollments_on_course_id", using: :btree
  add_index "enrollments", ["student_id"], name: "index_enrollments_on_student_id", using: :btree

  create_table "lecturers", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.date     "date_of_birth"
    t.date     "date_of_joining"
    t.decimal  "salary",                    precision: 10
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "lecturers", ["user_id"], name: "index_lecturers_on_user_id", using: :btree

  create_table "majors", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "marks", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.integer  "subject_id", limit: 4
    t.float    "value",      limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "marks", ["student_id"], name: "index_marks_on_student_id", using: :btree
  add_index "marks", ["subject_id"], name: "index_marks_on_subject_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.date     "date_of_birth"
    t.date     "date_of_joining"
    t.date     "date_of_leaving"
    t.integer  "major_id",            limit: 4
    t.float    "grade_point_average", limit: 24
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "students", ["major_id"], name: "index_students_on_major_id", using: :btree
  add_index "students", ["user_id"], name: "index_students_on_user_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "credits",     limit: 4
    t.text     "description", limit: 65535
    t.integer  "course_id",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "subjects", ["course_id"], name: "index_subjects_on_course_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "remember_digest", limit: 255
    t.integer  "role",            limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "classroom_students", "classrooms"
  add_foreign_key "classroom_students", "students"
  add_foreign_key "classrooms", "lecturers"
  add_foreign_key "classrooms", "subjects"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "students"
  add_foreign_key "lecturers", "users"
  add_foreign_key "marks", "students"
  add_foreign_key "marks", "subjects"
  add_foreign_key "students", "majors"
  add_foreign_key "students", "users"
  add_foreign_key "subjects", "courses"
end
