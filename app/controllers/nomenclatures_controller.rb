class NomenclaturesController < ApplicationController

  def index
    @nomenclatures = Nomenclature.includes(:translations).order(:name)
    respond_to do |format|
      format.html
      format.xml  { render  xml: @nomenclatures.to_xml }
      format.json { render json: @nomenclatures.to_json }
    end
  end

  def show
    @nomenclature = Nomenclature.find_by(name: params[:id])
  end

end
