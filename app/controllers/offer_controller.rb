  class OfferController < ApplicationController
  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
  end

    def create
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id

    if @offer.save
      redirect_to offer_path(@offer)
      else
        render :new
    end

  end

  private

  def offer_params
    params.require(:offer).permit(:description, :material, :unit, :amount, :price, :location, :available, :user_id)
  end

  end
