# == Schema Information
#
# Table name: item_translations
#
#  id          :integer          not null, primary key
#  item_id     :integer          not null
#  language    :string           not null
#  label       :text
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class ItemTranslationsController < ApplicationController
end
