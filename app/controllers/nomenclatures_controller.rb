require 'csv'

class NomenclaturesController < ApplicationController

  def index
    @nomenclatures = Nomenclature.localized
  end

  def show
    @nomenclature = Nomenclature.find_by(name: params[:id])
  end

end
