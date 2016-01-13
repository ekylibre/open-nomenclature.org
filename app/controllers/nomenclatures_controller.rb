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

require 'csv'

class NomenclaturesController < ApplicationController
  def index
    @nomenclatures = Nomenclature.localized.includes(property_natures: :choices_nomenclature).references(property_natures: :choices_nomenclature)
  end

  def show
    @nomenclature = Nomenclature.find_by(name: params[:id])
  end

  def tree
    @nomenclature = Nomenclature.find_by(name: params[:id])
  end
end
