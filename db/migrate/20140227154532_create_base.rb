class CreateBase < ActiveRecord::Migration
  def change
    create_table :nomenspaces do |t|
      t.references :parent, index: true
      t.string :name,                          null: false
      t.string :state,                         null: false
      t.integer :lft
      t.integer :rgt
      t.integer :depth
      t.timestamps
      t.index :name
    end

    create_table :nomenclatures do |t|
      t.references :nomenspace, index: true
      # t.references :parent,                                     index: true
      t.references :property, index: true
      t.string :name, null: false
      t.boolean :translateable, default: false, null: false
      t.boolean :hierarchical,  default: false, null: false
      t.string :state, null: false
      t.timestamps
      t.index :name
    end

    create_table :items do |t|
      t.references :nomenclature, null: false, index: true
      t.references :parent, index: true
      t.string :parent_name
      t.string :name,                          null: false
      t.string :state,                         null: false
      t.integer :lft
      t.integer :rgt
      t.integer :depth
      t.timestamps
      t.index :name
      t.index :parent_name
    end

    create_table :properties do |t|
      t.references :item,                          null: false, index: true
      t.references :nature,                        null: false, index: true
      t.text :value, null: false
      t.timestamps
    end

    create_table :property_natures do |t|
      t.references :nomenclature, null: false, index: true
      t.string :name,                          null: false
      t.string :datatype,                      null: false
      t.boolean :required, default: false, null: false
      t.text :default_value
      t.string :fallbacks
      t.string :state, null: false
      t.references :choices_nomenclature, index: true
      t.string :choices_nomenclature_name
      t.timestamps
      t.index :name
      t.index :choices_nomenclature_name
    end

    for reference in [:nomenspace, :nomenclature, :item, :property_nature]
      create_table "#{reference}_translations".to_sym do |t|
        t.references reference, null: false # , index: true
        t.string :language, null: false
        t.text :label
        t.text :description
        t.timestamps
        # t.index      ["#{reference}_id".to_sym, :language]
        t.index :language
      end
    end
  end
end
