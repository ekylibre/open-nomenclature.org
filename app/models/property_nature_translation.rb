# == Schema Information
#
# Table name: property_nature_translations
#
#  id                 :integer          not null, primary key
#  property_nature_id :integer          not null
#  language           :string(255)      not null
#  label              :text
#  description        :text
#  created_at         :datetime
#  updated_at         :datetime
#

class PropertyNatureTranslation < ActiveRecord::Base
end
