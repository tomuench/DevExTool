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

ActiveRecord::Schema[7.0].define(version: 2024_11_02_114354) do
  create_table "rapidfire_answers", force: :cascade do |t|
    t.integer "attempt_id"
    t.integer "question_id"
    t.text "answer_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attempt_id"], name: "index_rapidfire_answers_on_attempt_id"
    t.index ["question_id"], name: "index_rapidfire_answers_on_question_id"
  end

  create_table "rapidfire_attempts", force: :cascade do |t|
    t.integer "survey_id"
    t.string "user_type"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "workflow_step_id"
    t.index ["survey_id"], name: "index_rapidfire_attempts_on_survey_id"
    t.index ["user_id", "user_type"], name: "index_rapidfire_attempts_on_user_id_and_user_type"
    t.index ["user_type", "user_id"], name: "index_rapidfire_attempts_on_user"
  end

  create_table "rapidfire_questions", force: :cascade do |t|
    t.integer "survey_id"
    t.string "type"
    t.string "question_text"
    t.string "default_text"
    t.string "placeholder"
    t.integer "position"
    t.text "answer_options"
    t.text "validation_rules"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_rapidfire_questions_on_survey_id"
  end

  create_table "rapidfire_surveys", force: :cascade do |t|
    t.string "name"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "after_survey_content"
    t.boolean "active"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workflow_steps", force: :cascade do |t|
    t.integer "workflow_id"
    t.time "start"
    t.string "title"
    t.text "description"
    t.time "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
  end

  create_table "workflows", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "rapidfire_attempts", "workflow_steps"
  add_foreign_key "workflow_steps", "workflows"
  add_foreign_key "workflows", "users"
end
