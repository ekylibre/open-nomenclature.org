class NomenclaturesController < ApplicationController

  def index
    @nomenclatures = Nomenclature.includes(:translations).order(:name)
  end

  def show
    @nomenclature = Nomenclature.find_by(name: params[:id])
  end

end
