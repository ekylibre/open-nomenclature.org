# == Schema Information
#
# Table name: nomenclatures
#
#  id            :integer          not null, primary key
#  nomenspace_id :integer
#  property_id   :integer
#  name          :string           not null
#  translateable :boolean          default(FALSE), not null
#  hierarchical  :boolean          default(FALSE), not null
#  state         :string           not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Nomenclature < ActiveRecord::Base
  include Translateable, Checkable
  belongs_to :property
  belongs_to :nomenspace
  has_many :property_natures
  has_many :items

  def to_param
    name
  end
end
