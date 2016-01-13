# == Schema Information
#
# Table name: nomenspace_translations
#
#  id            :integer          not null, primary key
#  nomenspace_id :integer          not null
#  language      :string           not null
#  label         :text
#  description   :text
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class NomenspaceTranslationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
