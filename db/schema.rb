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

ActiveRecord::Schema[7.0].define(version: 2023_11_18_023053) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversation_groups", force: :cascade do |t|
    t.string "name"
    t.integer "kinds", default: 0
    t.boolean "is_blocked", default: false
    t.boolean "read_only", default: false
    t.boolean "moderated", default: false
    t.bigint "created_by_id", null: false
    t.boolean "closed", default: false
    t.datetime "closed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "unit_dg"
    t.index ["created_by_id"], name: "index_conversation_groups_on_created_by_id"
  end

  create_table "participants", force: :cascade do |t|
    t.integer "status", default: 0
    t.boolean "moderated", default: false
    t.bigint "user_id", null: false
    t.string "talk_type", null: false
    t.bigint "talk_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["talk_type", "talk_id"], name: "index_participants_on_talk"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "units", force: :cascade do |t|
    t.string "name", null: false
    t.integer "unit_dg", null: false
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_dg"], name: "index_units_on_unit_dg", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.integer "fractal_id", null: false
    t.string "token_dg", null: false
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "unit_dg"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["fractal_id"], name: "index_users_on_fractal_id", unique: true
    t.index ["token_dg"], name: "index_users_on_token_dg", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "conversation_groups", "units", column: "unit_dg", primary_key: "unit_dg"
  add_foreign_key "conversation_groups", "users", column: "created_by_id"
  add_foreign_key "participants", "users"
  add_foreign_key "users", "units", column: "unit_dg", primary_key: "unit_dg"
end
