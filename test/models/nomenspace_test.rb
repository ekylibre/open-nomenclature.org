# == Schema Information
#
# Table name: nomenspaces
#
#  id         :integer          not null, primary key
#  parent_id  :integer
#  name       :string           not null
#  state      :string           not null
#  lft        :integer
#  rgt        :integer
#  depth      :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class NomenspaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
