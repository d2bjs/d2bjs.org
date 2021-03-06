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

ActiveRecord::Schema.define(version: 20170226035011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "type",                   default: "ExampleCategory"
    t.string   "fa_icon"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "data", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.string   "name"
    t.text     "markdown"
    t.text     "description"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.integer  "category_id"
    t.boolean  "private"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "widgets", force: :cascade do |t|
    t.integer  "entry_id"
    t.string   "type",               default: "EmbeddedWidget"
    t.string   "name"
    t.string   "iframe_url"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "markdown"
    t.text     "caption"
    t.integer  "index"
    t.text     "html",               default: "<div id = 'chart'></div>"
    t.text     "css",                default: "#chart{\n\theight: 500px;\n}"
    t.text     "js",                 default: "var pie = d2b.chartPie();\n\nvar chart = d3.select('#chart')\n\t.datum([\n\t\t{label: 'arc 1', value: 23},\n\t\t{label: 'arc 2', value: 31},\n\t\t{label: 'arc 3', value: 80},\n\t\t{label: 'arc 4', value: 8}\n\t])\n\t.call(pie);\n\nwindow.addEventListener('resize', function(){\n\tchart.call(pie);\n});"
    t.datetime "created_at",                                                                                                                                                                                                                                                                                                                                   null: false
    t.datetime "updated_at",                                                                                                                                                                                                                                                                                                                                   null: false
    t.string   "code_visibility",    default: "js"
    t.integer  "order",              default: 0
  end

end
