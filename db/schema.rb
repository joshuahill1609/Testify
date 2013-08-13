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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130813211254) do

  create_table "answer_orders", :force => true do |t|
    t.string   "content"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.string   "body"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "correct_answers", :force => true do |t|
    t.integer  "question_id"
    t.string   "body"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "essay_questions", :force => true do |t|
    t.string   "content"
    t.integer  "exam_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "exam_grade_levels", :force => true do |t|
    t.integer  "exam_id"
    t.integer  "grade_level_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "exams", :force => true do |t|
    t.string   "exam_name"
    t.string   "exam_subject"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "examtags", :force => true do |t|
    t.integer  "exam_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "grade_levels", :force => true do |t|
    t.integer  "grade_level"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "exam_id"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.integer  "exam_id"
    t.string   "tag_title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tests", :force => true do |t|
    t.string   "test_name"
    t.string   "subject"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "true_false_answers", :force => true do |t|
    t.string   "content"
    t.integer  "true_false_question_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "true_false_questions", :force => true do |t|
    t.string   "content"
    t.integer  "exam_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "session_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "school_name"
    t.string   "subject_taught"
    t.integer  "grade_taught"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
