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

ActiveRecord::Schema.define(version: 2019_05_01_140934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "biscomments", force: :cascade do |t|
    t.bigint "comment_id"
    t.bigint "author_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_biscomments_on_author_id"
    t.index ["comment_id"], name: "index_biscomments_on_comment_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "gossip_id"
    t.bigint "author_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["gossip_id"], name: "index_comments_on_gossip_id"
  end

  create_table "gossips", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_gossips_on_user_id"
  end

  create_table "join_table_gossip_tags", force: :cascade do |t|
    t.bigint "gossip_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gossip_id"], name: "index_join_table_gossip_tags_on_gossip_id"
    t.index ["tag_id"], name: "index_join_table_gossip_tags_on_tag_id"
  end

  create_table "join_table_message_recipients", force: :cascade do |t|
    t.bigint "message_id"
    t.bigint "recipient_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_join_table_message_recipients_on_message_id"
    t.index ["recipient_id"], name: "index_join_table_message_recipients_on_recipient_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "sender_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.bigint "city_id"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
  end

  add_foreign_key "biscomments", "comments"
  add_foreign_key "comments", "gossips"
  add_foreign_key "gossips", "users"
  add_foreign_key "join_table_gossip_tags", "gossips"
  add_foreign_key "join_table_gossip_tags", "tags"
  add_foreign_key "join_table_message_recipients", "messages"
end
