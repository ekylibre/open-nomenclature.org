class ItemsController < ApplicationController

  def show
    nomenclature = Nomenclature.find_by(name: params[:nomenclature_id])
    @item = nomenclature.items.find_by(name: params[:id])
  end

end
