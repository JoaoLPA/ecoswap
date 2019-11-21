  class OfferController < ApplicationController
    def index
      @offers = Offer.all
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

  end
