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

ActiveRecord::Schema.define(version: 20180303043857) do

  create_table "word_trees", force: :cascade do |t|
    t.string "main_word", null: false
    t.string "word1", default: "a", null: false
    t.string "html1", default: "a", null: false
    t.string "word2", default: "a", null: false
    t.string "html2", default: "a", null: false
    t.string "word3", default: "a", null: false
    t.string "html3", default: "a", null: false
    t.string "word4", default: "a", null: false
    t.string "html4", default: "a", null: false
    t.string "word5", default: "a", null: false
    t.string "html5", default: "a", null: false
    t.string "word6", default: "a", null: false
    t.string "html6", default: "a", null: false
    t.string "wiki_url", default: "a", null: false
    t.string "word_url", default: "a", null: false
    t.string "text", default: "a", null: false
    t.string "sum_text", default: "a", null: false
    t.boolean "is_done", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
