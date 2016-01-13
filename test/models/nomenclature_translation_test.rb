# == Schema Information
#
# Table name: nomenclature_translations
#
#  id              :integer          not null, primary key
#  nomenclature_id :integer          not null
#  language        :string           not null
#  label           :text
#  description     :text
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class NomenclatureTranslationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
