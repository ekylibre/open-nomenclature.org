class CreateBase < ActiveRecord::Migration
  def change

    create_table :nomenspaces do |t|
      t.references :parent,                                     index: true
      t.string     :name,                          null: false
      t.string     :state,                         null: false
      t.timestamps
      t.index      :name
    end

    create_table :nomenclatures do |t|
      t.references :nomenspace,                                 index: true
      t.references :parent,                                     index: true
      t.references :attribute,                                  index: true
      t.string     :name,                          null: false
      t.boolean    :translateable, default: false, null: false
      t.boolean    :hierarchical,  default: false, null: false
      t.string     :state,                         null: false
      t.timestamps
      t.index      :name
    end

    create_table :nomenclature_attributes do |t|
      t.references :nomenclature,                  null: false, index: true
      t.string     :name,                          null: false
      t.string     :nature,                        null: false
      t.boolean    :required,      default: false, null: false
      t.text       :default_value
      t.string     :fallbacks
      t.string     :state,                         null: false
      t.references :choices,                                    index: true
      t.timestamps
      t.index      :name
    end

    create_table :nomenclature_items do |t|
      t.references :nomenclature,                  null: false, index: true
      t.references :parent,                                     index: true
      t.string     :name,                          null: false
      t.string     :state,                         null: false
      t.timestamps
      t.index      :name
    end

    create_table :nomenclature_item_properties do |t|
      t.references :item,                          null: false, index: true
      t.references :attribute,                     null: false, index: true
      t.text       :value,                         null: false
      t.timestamps
    end

    for reference in [:nomenspace, :nomenclature, :nomenclature_attribute, :nomenclature_item_properties]
      create_table "#{reference}_translations".to_sym do |t|
        t.references reference,                      null: false # , index: true
        t.string     :language,                      null: false
        t.text       :name
        t.text       :description
        t.timestamps
        # t.index      ["#{reference}_id".to_sym, :language]
        t.index      :language
      end
    end

  end
end
