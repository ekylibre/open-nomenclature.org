# == Schema Information
#
# Table name: property_natures
#
#  id                        :integer          not null, primary key
#  nomenclature_id           :integer          not null
#  name                      :string           not null
#  datatype                  :string           not null
#  required                  :boolean          default(FALSE), not null
#  default_value             :text
#  fallbacks                 :string
#  state                     :string           not null
#  choices_nomenclature_id   :integer
#  choices_nomenclature_name :string
#  created_at                :datetime
#  updated_at                :datetime
#

class PropertyNature < ActiveRecord::Base
  include Translateable, Checkable
  belongs_to :nomenclature
  belongs_to :choices_nomenclature, class_name: 'Nomenclature'
end
