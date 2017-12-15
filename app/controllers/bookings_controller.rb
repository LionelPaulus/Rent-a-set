class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @place = Place.find(params[:place_id])
  end

  def create
    place = Place.find(params[:place_id])
    # if current_user == place.user
    #   flash[:alert] = "You can't book your own room"
    # else
      start_time = DateTime.parse(booking_params[:start_time])
      end_time = DateTime.parse(booking_params[:end_time])

      bookings = current_user.bookings.build(booking_params)
      bookings.start_time = start_time
      bookings.end_time = end_time
      bookings.place = place
      bookings.save

      flash[:notice] = "booking success"
    # end
    redirect_to place
  end

  def booking_params
    params.require(:booking).permit(:place_id, :start_time, :end_time)
  end 
end
