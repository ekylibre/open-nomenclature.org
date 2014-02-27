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

class Property < ActiveRecord::Base
  belongs_to :item
  belongs_to :nature, class_name: "PropertyNature"
end
