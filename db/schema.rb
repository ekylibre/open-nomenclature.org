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

ActiveRecord::Schema.define(version: 20140227154532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "item_translations", force: :cascade do |t|
    t.integer  "item_id",     null: false
    t.string   "language",    null: false
    t.text     "label"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_translations", ["language"], name: "index_item_translations_on_language", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "nomenclature_id", null: false
    t.integer  "parent_id"
    t.string   "parent_name"
    t.string   "name",            null: false
    t.string   "state",           null: false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["name"], name: "index_items_on_name", using: :btree
  add_index "items", ["nomenclature_id"], name: "index_items_on_nomenclature_id", using: :btree
  add_index "items", ["parent_id"], name: "index_items_on_parent_id", using: :btree
  add_index "items", ["parent_name"], name: "index_items_on_parent_name", using: :btree

  create_table "nomenclature_translations", force: :cascade do |t|
    t.integer  "nomenclature_id", null: false
    t.string   "language",        null: false
    t.text     "label"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nomenclature_translations", ["language"], name: "index_nomenclature_translations_on_language", using: :btree

  create_table "nomenclatures", force: :cascade do |t|
    t.integer  "nomenspace_id"
    t.integer  "property_id"
    t.string   "name",                          null: false
    t.boolean  "translateable", default: false, null: false
    t.boolean  "hierarchical",  default: false, null: false
    t.string   "state",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nomenclatures", ["name"], name: "index_nomenclatures_on_name", using: :btree
  add_index "nomenclatures", ["nomenspace_id"], name: "index_nomenclatures_on_nomenspace_id", using: :btree
  add_index "nomenclatures", ["property_id"], name: "index_nomenclatures_on_property_id", using: :btree

  create_table "nomenspace_translations", force: :cascade do |t|
    t.integer  "nomenspace_id", null: false
    t.string   "language",      null: false
    t.text     "label"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nomenspace_translations", ["language"], name: "index_nomenspace_translations_on_language", using: :btree

  create_table "nomenspaces", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "name",       null: false
    t.string   "state",      null: false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nomenspaces", ["name"], name: "index_nomenspaces_on_name", using: :btree
  add_index "nomenspaces", ["parent_id"], name: "index_nomenspaces_on_parent_id", using: :btree

  create_table "properties", force: :cascade do |t|
    t.integer  "item_id",    null: false
    t.integer  "nature_id",  null: false
    t.text     "value",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "properties", ["item_id"], name: "index_properties_on_item_id", using: :btree
  add_index "properties", ["nature_id"], name: "index_properties_on_nature_id", using: :btree

  create_table "property_nature_translations", force: :cascade do |t|
    t.integer  "property_nature_id", null: false
    t.string   "language",           null: false
    t.text     "label"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "property_nature_translations", ["language"], name: "index_property_nature_translations_on_language", using: :btree

  create_table "property_natures", force: :cascade do |t|
    t.integer  "nomenclature_id",                           null: false
    t.string   "name",                                      null: false
    t.string   "datatype",                                  null: false
    t.boolean  "required",                  default: false, null: false
    t.text     "default_value"
    t.string   "fallbacks"
    t.string   "state",                                     null: false
    t.integer  "choices_nomenclature_id"
    t.string   "choices_nomenclature_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "property_natures", ["choices_nomenclature_id"], name: "index_property_natures_on_choices_nomenclature_id", using: :btree
  add_index "property_natures", ["choices_nomenclature_name"], name: "index_property_natures_on_choices_nomenclature_name", using: :btree
  add_index "property_natures", ["name"], name: "index_property_natures_on_name", using: :btree
  add_index "property_natures", ["nomenclature_id"], name: "index_property_natures_on_nomenclature_id", using: :btree

end
