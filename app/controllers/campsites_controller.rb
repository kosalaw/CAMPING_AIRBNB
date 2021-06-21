class CampsitesController < ApplicationController

  def index
    # HOMEPAGE search bar filtering
    if params[:location].present? #&& params[:guest].present?
      sql_query = " \
        campsites.address @@ :location \
        AND campsites.capacity >= :guest \
      "
      campsites = Campsite.where(sql_query, location: "%#{params[:location]}%", guest: params[:guest].to_i)
      @campsites = check_availability(params, campsites)
      p @campsites.class

      # KEEP THIS LOOP! This one doesnt work if you use '.geocoded'!!!!
      @markers = @campsites.map do |campsite|
      {
        lat: campsite.latitude,
        lng: campsite.longitude,
        info_window: render_to_string(partial: "info_window", locals: { campsite: campsite })
      }
      end

    else
      @campsites = Campsite.all
      p @campsites.class

      # KEEP THIS LOOP AS WELL! This one DOES work if you use '.geocoded'!!!!
      @markers = @campsites.geocoded.map do |campsite|
      {
        lat: campsite.latitude,
        lng: campsite.longitude,
        info_window: render_to_string(partial: "info_window", locals: { campsite: campsite })
      }
      end
    end
  end

  # checks which dates are alrady taken at each campsite
  def check_availability(params, campsites)
    # make array of inputed dates
    user_dates = (params[:start]..params[:end]).to_a

    # get all start and end dates of ALL bookings
    temp_campsites = []
    taken_dates = []

    campsites.each do |campsite|
      taken_dates = []
      campsite.bookings.each do |booking|
        # all taken dates for 1 campsite
        taken_dates << ((booking[:start_date].strftime("%Y-%m-%d"))..booking[:end_date].strftime("%Y-%m-%d")).to_a
      end

      taken_dates = taken_dates.flatten
      # p user_dates
      # p taken_dates
      if taken_dates[0].nil?
        puts "No bookings made by anyone - all dates avaiable"
        temp_campsites << campsite
      elsif user_dates.all? { |date| taken_dates.include?(date)}
        puts "NO AVAILABLITY"
      elsif user_dates.all? { |date| !taken_dates.include?(date)}
        puts "All days avaiable"
        temp_campsites << campsite
      else
        puts "some dates avaiable"
        temp_campsites << campsite
      end
    end

    return temp_campsites
  end


  def show
    @campsite = Campsite.find(params[:id])
    @booking = Booking.new
    campsite_array = []
    campsite_array << @campsite
    # Shows the campsite marker location on map
    @markers = campsite_array.map do |campsite|
    {
      lat: campsite.latitude,
      lng: campsite.longitude,
      info_window: render_to_string(partial: "info_window", locals: { campsite: campsite })
    }
    end
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
