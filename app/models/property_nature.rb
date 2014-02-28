# == Schema Information
#
# Table name: property_natures
#
#  id              :integer          not null, primary key
#  nomenclature_id :integer          not null
#  name            :string(255)      not null
#  datatype        :string(255)      not null
#  required        :boolean          default(FALSE), not null
#  default_value   :text
#  fallbacks       :string(255)
#  state           :string(255)      not null
#  choices_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class PropertyNature < ActiveRecord::Base
  include Translateable, Checkable
  belongs_to :nomenclature
  belongs_to :choices, class_name: "Nomenclature"
end
