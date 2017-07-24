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

ActiveRecord::Schema.define(version: 20170717145535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

  create_table "aggregators", force: :cascade do |t|
    t.integer "aggregator_status"
    t.string  "aggregator_name"
    t.string  "db_connection"
    t.string  "message_queue_connection"
  end

  create_table "hosts", force: :cascade do |t|
    t.string   "domain",         limit: 255
    t.integer  "user_id"
    t.string   "prot",           limit: 255
    t.integer  "monitor_status"
    t.integer  "last_status"
    t.datetime "last_check"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "last_node"
    t.string   "name"
  end

  create_table "hosts_notifications", id: false, force: :cascade do |t|
    t.integer "host_id",         null: false
    t.integer "notification_id", null: false
    t.index ["host_id", "notification_id"], name: "index_hosts_notifications_on_host_id_and_notification_id", using: :btree
    t.index ["notification_id", "host_id"], name: "index_notifications_hosts_on_notification_id_and_host_id", using: :btree
  end

  create_table "nodes", force: :cascade do |t|
    t.integer  "node_status"
    t.string   "node_name"
    t.string   "ip"
    t.string   "geo_name"
    t.string   "db_connection"
    t.string   "message_queue_connection"
    t.string   "queue_name"
    t.datetime "heartbeat"
  end

  create_table "notification_types", force: :cascade do |t|
    t.string   "name"
    t.string   "parameter_1_name"
    t.string   "parameter_2_name"
    t.string   "parameter_3_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "name"
    t.integer  "notification_type_id"
    t.string   "parameter_1"
    t.string   "parameter_2"
    t.string   "parameter_3"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["notification_type_id"], name: "index_notifications_on_notification_type_id", using: :btree
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "statuses", force: :cascade do |t|
    t.integer  "host_id"
    t.datetime "dt"
    t.integer  "status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "response_time"
    t.string   "node_name"
    t.integer  "node_id"
    t.string   "error_description"
    t.string   "url"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "full_name",              limit: 255
    t.boolean  "admin"
    t.string   "authentication_token",   limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "notifications", "notification_types"
  add_foreign_key "notifications", "users"
end
