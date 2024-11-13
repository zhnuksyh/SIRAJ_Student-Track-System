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

ActiveRecord::Schema[7.2].define(version: 2024_11_13_155151) do
  create_schema "auth"
  create_schema "extensions"
  create_schema "graphql"
  create_schema "graphql_public"
  create_schema "pgbouncer"
  create_schema "pgsodium"
  create_schema "pgsodium_masks"
  create_schema "realtime"
  create_schema "storage"
  create_schema "vault"

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_graphql"
  enable_extension "pg_stat_statements"
  enable_extension "pgcrypto"
  enable_extension "pgjwt"
  enable_extension "pgsodium"
  enable_extension "plpgsql"
  enable_extension "supabase_vault"
  enable_extension "uuid-ossp"

  create_table "Student", primary_key: "StudentID", id: :bigint, default: nil, comment: "Student information is stored here", force: :cascade do |t|
    t.text "StudentName"
    t.text "StudentGrade"
    t.text "StudentClass"
    t.timestamptz "created_at", default: -> { "now()" }, null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "examples", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_tests", force: :cascade do |t|
    t.string "StudentName"
    t.string "StudentClass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", default: -> { "(now() AT TIME ZONE 'utc'::text)" }, null: false
    t.datetime "updated_at", null: false
    t.text "StudentName"
    t.text "StudentGrade"
    t.text "StudentClass"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.string "password_hash", limit: 255, null: false
    t.timestamptz "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.timestamptz "updated_at", default: -> { "CURRENT_TIMESTAMP" }

    t.unique_constraint ["email"], name: "users_email_key"
    t.unique_constraint ["username"], name: "users_username_key"
  end
end
