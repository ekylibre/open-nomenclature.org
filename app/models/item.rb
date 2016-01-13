# == Schema Information
#
# Table name: items
#
#  id              :integer          not null, primary key
#  nomenclature_id :integer          not null
#  parent_id       :integer
#  parent_name     :string
#  name            :string           not null
#  state           :string           not null
#  lft             :integer
#  rgt             :integer
#  depth           :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Item < ActiveRecord::Base
  include Translateable, Checkable
  belongs_to :nomenclature
  has_many :properties
  belongs_to :parent, class_name: 'Item'
  acts_as_nested_set

  delegate :name, to: :nomenclature, prefix: true
  scope :root, -> { where(parent_id: nil) }

  def to_param
    name
  end

  def siblings
    super.where(nomenclature: nomenclature)
  end

  def get(property_nature)
    unless property_nature.is_a? PropertyNature
      property_nature = nomenclature.property_nature.find_by(name: property_nature)
    end
    properties.find_by(nature_id: property_nature.id)
  end
end
