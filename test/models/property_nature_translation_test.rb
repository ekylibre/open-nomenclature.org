# == Schema Information
#
# Table name: property_nature_translations
#
#  id                 :integer          not null, primary key
#  property_nature_id :integer          not null
#  language           :string           not null
#  label              :text
#  description        :text
#  created_at         :datetime
#  updated_at         :datetime
#

require 'test_helper'

class PropertyNatureTranslationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
