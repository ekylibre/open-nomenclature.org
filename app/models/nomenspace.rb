# == Schema Information
#
# Table name: nomenspaces
#
#  id         :integer          not null, primary key
#  parent_id  :integer
#  name       :string(255)      not null
#  state      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Nomenspace < ActiveRecord::Base
  include Translateable, Checkable
  has_many :nomenclatures
  acts_as_nested_set

  def to_param
    self.name
  end
end
