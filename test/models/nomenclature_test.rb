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

require 'test_helper'

class NomenclatureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
