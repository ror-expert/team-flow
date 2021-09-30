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

ActiveRecord::Schema.define(version: 2021_09_30_165622) do

  create_table "alerts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_alerts_on_project_id"
  end

  create_table "event_stream_fields", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "event_stream_id", null: false
    t.string "data_type"
    t.string "stream_type"
    t.boolean "required"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_stream_id"], name: "index_event_stream_fields_on_event_stream_id"
  end

  create_table "event_streams", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_event_streams_on_project_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "organisation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organisation_id"], name: "index_projects_on_organisation_id"
  end

  create_table "report_items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "report_id", null: false
    t.string "report_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["report_id"], name: "index_report_items_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_reports_on_project_id"
  end

  create_table "simulation_steps", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "sm_type"
    t.integer "simulation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["simulation_id"], name: "index_simulation_steps_on_simulation_id"
  end

  create_table "simulations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_simulations_on_project_id"
  end

  create_table "time_flow_monitors", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_time_flow_monitors_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "organisation_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "alerts", "projects"
  add_foreign_key "event_stream_fields", "event_streams"
  add_foreign_key "projects", "organisations"
  add_foreign_key "report_items", "reports"
  add_foreign_key "simulation_steps", "simulations"
  add_foreign_key "simulations", "projects"
  add_foreign_key "time_flow_monitors", "projects"
end
