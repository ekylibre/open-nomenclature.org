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

  create_table "nomenclature_attribute_translations", force: true do |t|
    t.integer  "nomenclature_attribute_id", null: false
    t.string   "language",                  null: false
    t.text     "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nomenclature_attribute_translations", ["language"], name: "index_nomenclature_attribute_translations_on_language", using: :btree

  create_table "nomenclature_attributes", force: true do |t|
    t.integer  "nomenclature_id",                 null: false
    t.string   "name",                            null: false
    t.string   "nature",                          null: false
    t.boolean  "required",        default: false, null: false
    t.text     "default_value"
    t.string   "fallbacks"
    t.string   "state",                           null: false
    t.integer  "choices_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nomenclature_attributes", ["choices_id"], name: "index_nomenclature_attributes_on_choices_id", using: :btree
  add_index "nomenclature_attributes", ["name"], name: "index_nomenclature_attributes_on_name", using: :btree
  add_index "nomenclature_attributes", ["nomenclature_id"], name: "index_nomenclature_attributes_on_nomenclature_id", using: :btree

  create_table "nomenclature_item_properties", force: true do |t|
    t.integer  "item_id",      null: false
    t.integer  "attribute_id", null: false
    t.text     "value",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nomenclature_item_properties", ["attribute_id"], name: "index_nomenclature_item_properties_on_attribute_id", using: :btree
  add_index "nomenclature_item_properties", ["item_id"], name: "index_nomenclature_item_properties_on_item_id", using: :btree

  create_table "nomenclature_item_properties_translations", force: true do |t|
    t.integer  "nomenclature_item_properties_id", null: false
    t.string   "language",                        null: false
    t.text     "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nomenclature_item_properties_translations", ["language"], name: "index_nomenclature_item_properties_translations_on_language", using: :btree

  create_table "nomenclature_items", force: true do |t|
    t.integer  "nomenclature_id", null: false
    t.integer  "parent_id"
    t.string   "name",            null: false
    t.string   "state",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nomenclature_items", ["name"], name: "index_nomenclature_items_on_name", using: :btree
  add_index "nomenclature_items", ["nomenclature_id"], name: "index_nomenclature_items_on_nomenclature_id", using: :btree
  add_index "nomenclature_items", ["parent_id"], name: "index_nomenclature_items_on_parent_id", using: :btree

  create_table "nomenclature_translations", force: true do |t|
    t.integer  "nomenclature_id", null: false
    t.string   "language",        null: false
    t.text     "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nomenclature_translations", ["language"], name: "index_nomenclature_translations_on_language", using: :btree

  create_table "nomenclatures", force: true do |t|
    t.integer  "nomenspace_id"
    t.integer  "parent_id"
    t.integer  "attribute_id"
    t.string   "name",                          null: false
    t.boolean  "translateable", default: false, null: false
    t.boolean  "hierarchical",  default: false, null: false
    t.string   "state",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nomenclatures", ["attribute_id"], name: "index_nomenclatures_on_attribute_id", using: :btree
  add_index "nomenclatures", ["name"], name: "index_nomenclatures_on_name", using: :btree
  add_index "nomenclatures", ["nomenspace_id"], name: "index_nomenclatures_on_nomenspace_id", using: :btree
  add_index "nomenclatures", ["parent_id"], name: "index_nomenclatures_on_parent_id", using: :btree

  create_table "nomenspace_translations", force: true do |t|
    t.integer  "nomenspace_id", null: false
    t.string   "language",      null: false
    t.text     "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nomenspace_translations", ["language"], name: "index_nomenspace_translations_on_language", using: :btree

  create_table "nomenspaces", force: true do |t|
    t.integer  "parent_id"
    t.string   "name",       null: false
    t.string   "state",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nomenspaces", ["name"], name: "index_nomenspaces_on_name", using: :btree
  add_index "nomenspaces", ["parent_id"], name: "index_nomenspaces_on_parent_id", using: :btree

end
