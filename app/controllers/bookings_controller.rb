class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @place_id = params[:place_id]
  end

  def create
    place = Place.find(params[:place_id])
    if current_user == place.user
      flash[:alert] = "You can't book own room"
    end
  end
end
