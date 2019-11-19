  class MaterialController < ApplicationController
  def index
    @materials = Material.all
  end

  def show
    @material = Material.find(params[:id])
  end

  def new
    @material = Material.new
  end

  def create
    raise
    @material = Material.new(material_params)
    raise

  end


  private

  def material_params
    params.require(:material).permit(:description, :price, :amount, :location, :available, :user_id)
  end
end
