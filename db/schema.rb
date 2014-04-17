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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131201000005) do

  create_table "content_extensions", force: true do |t|
    t.integer "content_id",   null: false
    t.integer "extension_id", null: false
  end

  add_index "content_extensions", ["content_id"], name: "index_content_extensions_on_content_id"
  add_index "content_extensions", ["extension_id"], name: "index_content_extensions_on_extension_id"

  create_table "content_tags", force: true do |t|
    t.integer "content_id", null: false
    t.integer "tag_id",     null: false
  end

  add_index "content_tags", ["content_id"], name: "index_content_tags_on_content_id"
  add_index "content_tags", ["tag_id"], name: "index_content_tags_on_tag_id"

  create_table "contents", force: true do |t|
    t.string  "title",                         null: false
    t.string  "author"
    t.boolean "published",     default: true,  null: false
    t.boolean "featured",      default: false, null: false
    t.string  "abstract"
    t.string  "abstract_html"
    t.text    "body",                          null: false
    t.text    "body_html",                     null: false
    t.string  "path",                          null: false
    t.string  "locator",                       null: false
    t.string  "category",                      null: false
    t.date    "date"
  end

  create_table "extensions", force: true do |t|
    t.string "name",    null: false
    t.string "locator", null: false
  end

  create_table "tags", force: true do |t|
    t.string "name",    null: false
    t.string "locator", null: false
  end

end
