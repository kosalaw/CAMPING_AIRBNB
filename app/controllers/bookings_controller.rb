class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @campsite = Campsite.find(params[:campsite_id])
    @booking.campsite = @campsite
    numb_days =  (@booking.end_date - @booking.start_date).to_i
    @booking.total_price = @campsite.price_per_night * @booking.number_of_guest * numb_days
    if @booking.save
      redirect_to my_account_path(current_user)
    else
      render "campsites/show"
    end
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :number_of_guest, :status)
  end

end
