class PassController < ApplicationController
  respond_to :html

  def index
    @medications = Medication.all
    respond_with(@medications)
  end

  def show
    @medication = Medication.find(params[:id])
    render :pkpass => @medication
  end
end