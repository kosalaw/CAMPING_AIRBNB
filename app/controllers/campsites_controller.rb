class CampsitesController < ApplicationController

  def index
    @campsites = Campsite.all
  end

  def show
    @campsite = Campsite.find(params[:id])
    @booking = Booking.new
  end

  def new
    @campsite = Campsite.new
  end

  def create
    @campsite = Campsite.new(campsite_params)
    @campsite.user = current_user
    if @campsite.save
      redirect_to campsite_path(@campsite)
    else
      render :new
    end
  end

  private

  def campsite_params
    params.require(:campsite).permit(:name, :address, :description, :price_per_night, :capacity, :photo)
  end


end
