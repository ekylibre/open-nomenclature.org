# == Schema Information
#
# Table name: items
#
#  id              :integer          not null, primary key
#  nomenclature_id :integer          not null
#  parent_id       :integer
#  name            :string(255)      not null
#  state           :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class Item < ActiveRecord::Base
  include Translateable, Checkable
  belongs_to :nomenclature
  has_many :properties
  acts_as_nested_set

  def to_param
    self.name
  end
end
