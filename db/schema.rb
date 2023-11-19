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

ActiveRecord::Schema[7.0].define(version: 2023_11_19_000522) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.text "content", null: false
    t.integer "moderation_status", default: 0
    t.datetime "moderated_at"
    t.datetime "refused_at"
    t.bigint "moderator_id"
    t.bigint "response_id"
    t.bigint "talk_channel_id", null: false
    t.string "talk_type", null: false
    t.bigint "talk_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["moderator_id"], name: "index_messages_on_moderator_id"
    t.index ["response_id"], name: "index_messages_on_response_id"
    t.index ["talk_channel_id"], name: "index_messages_on_talk_channel_id"
    t.index ["talk_type", "talk_id"], name: "index_messages_on_talk"
  end

  create_table "talk_channels", force: :cascade do |t|
    t.string "name"
    t.integer "kinds", default: 0, null: false
    t.boolean "is_blocked", default: false, null: false
    t.boolean "read_only", default: false, null: false
    t.boolean "moderated", default: false, null: false
    t.bigint "created_by_id", null: false
    t.boolean "closed", default: false, null: false
    t.datetime "closed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "unit_dg"
    t.index ["created_by_id"], name: "index_talk_channels_on_created_by_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name", null: false
    t.integer "unit_dg", null: false
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_units_on_name", unique: true
    t.index ["unit_dg"], name: "index_units_on_unit_dg", unique: true
  end

  create_table "user_talks", force: :cascade do |t|
    t.integer "status", default: 0
    t.bigint "participant_id", null: false
    t.string "conversation_type", null: false
    t.bigint "conversation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_type", "conversation_id"], name: "index_user_talks_on_conversation"
    t.index ["participant_id"], name: "index_user_talks_on_participant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.integer "fractal_id", null: false
    t.string "token_dg", null: false
    t.string "photo_url"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "unit_dg"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["fractal_id"], name: "index_users_on_fractal_id", unique: true
    t.index ["token_dg"], name: "index_users_on_token_dg", unique: true
  end

  add_foreign_key "messages", "messages", column: "response_id"
  add_foreign_key "messages", "talk_channels"
  add_foreign_key "messages", "users", column: "moderator_id"
  add_foreign_key "talk_channels", "units", column: "unit_dg", primary_key: "unit_dg"
  add_foreign_key "talk_channels", "users", column: "created_by_id"
  add_foreign_key "user_talks", "users", column: "participant_id"
  add_foreign_key "users", "units", column: "unit_dg", primary_key: "unit_dg"
end
