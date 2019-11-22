  class OfferController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]
    before_action :set_materials_name, only: :index

  def index
    if params[:query].present?
      @offers = Offer.offers_search(params[:query])
    else
      @offers = Offer.all
    end
  end

  def show
    @offer = Offer.find(params[:id])

    @markers =  {
        lat: @offer.latitude,
        lng: @offer.longitude
      }
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user

    if @offer.save
      redirect_to offer_path(@offer)
      else
        render :new
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:description, :material_id, :unit, :amount, :price, :location, :photo)
  end

  def set_materials_name
    materials = Material.all
    @materials = materials.map{ |material| material.name}
  end

  end
