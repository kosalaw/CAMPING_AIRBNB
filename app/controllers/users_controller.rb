class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bookings = @user.bookings
    @campsites = @user.campsites
    @my_campsites_bookings = @user.my_campsites_bookings
  end

end
