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

class NomenclatureTranslation < ActiveRecord::Base
  belongs_to :nomenclature, inverse_of: :translations
end
