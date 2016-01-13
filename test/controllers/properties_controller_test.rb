# == Schema Information
#
# Table name: properties
#
#  id         :integer          not null, primary key
#  item_id    :integer          not null
#  nature_id  :integer          not null
#  value      :text             not null
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class PropertiesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
