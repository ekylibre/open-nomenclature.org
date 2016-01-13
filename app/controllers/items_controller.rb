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

class ItemsController < ApplicationController
  def show
    nomenclature = Nomenclature.find_by(name: params[:nomenclature_id])
    @item = nomenclature.items.find_by(name: params[:id])
  end
end
