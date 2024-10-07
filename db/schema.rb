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

ActiveRecord::Schema[7.2].define(version: 2024_10_07_081710) do
  create_table "accounts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "rl_account_id"
    t.string "platform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "match_participants", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "match_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score"
    t.integer "goals"
    t.integer "assists"
    t.integer "saves"
    t.integer "shots"
    t.index ["match_id"], name: "index_match_participants_on_match_id"
    t.index ["user_id"], name: "index_match_participants_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "queue_id", null: false
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["queue_id"], name: "index_matches_on_queue_id"
  end

  create_table "platform_accounts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "platform"
    t.string "profile_link"
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_platform_accounts_on_user_id"
  end

  create_table "queues", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "account_id", null: false
    t.integer "server_id", null: false
    t.string "queue_type"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_queues_on_account_id"
    t.index ["server_id"], name: "index_queues_on_server_id"
    t.index ["user_id"], name: "index_queues_on_user_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.integer "account_id", null: false
    t.string "rank_tier"
    t.integer "division"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_ranks_on_account_id"
  end

  create_table "scrims", force: :cascade do |t|
    t.integer "team_one_id", null: false
    t.integer "team_two_id", null: false
    t.string "status"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_one_id"], name: "index_scrims_on_team_one_id"
    t.index ["team_two_id"], name: "index_scrims_on_team_two_id"
  end

  create_table "servers", force: :cascade do |t|
    t.string "server_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_accounts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "platform"
    t.string "profile_link"
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_social_accounts_on_user_id"
  end

  create_table "team_memberships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_memberships_on_team_id"
    t.index ["user_id"], name: "index_team_memberships_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "discord_id"
    t.string "username"
    t.integer "wins", default: 0
    t.integer "losses", default: 0
    t.integer "total_games", default: 0
    t.integer "streak", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "match_participants", "matches"
  add_foreign_key "match_participants", "users"
  add_foreign_key "matches", "queues"
  add_foreign_key "platform_accounts", "users"
  add_foreign_key "queues", "accounts"
  add_foreign_key "queues", "servers"
  add_foreign_key "queues", "users"
  add_foreign_key "ranks", "accounts"
  add_foreign_key "scrims", "team_ones"
  add_foreign_key "scrims", "team_twos"
  add_foreign_key "social_accounts", "users"
  add_foreign_key "team_memberships", "teams"
  add_foreign_key "team_memberships", "users"
end
