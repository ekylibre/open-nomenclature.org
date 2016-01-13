# == Schema Information
#
# Table name: items
#
#  id              :integer          not null, primary key
#  nomenclature_id :integer          not null
#  parent_id       :integer
#  parent_name     :string
#  name            :string           not null
#  state           :string           not null
#  lft             :integer
#  rgt             :integer
#  depth           :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
