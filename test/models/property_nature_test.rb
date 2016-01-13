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

require 'test_helper'

class PropertyNatureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
