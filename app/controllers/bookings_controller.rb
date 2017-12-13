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
    # if current_user == place.user
    #   flash[:alert] = "You can't book your own room"
    # else
      start_time = Date.parse(booking_params[:start_time])
      end_time = Date.parse(booking_params[:end_time])
      days = (end_time - start_time).to_i + 1

      logger.debug('=========================')
      logger.debug(days)

      bookings = current_user.bookings.build(booking_params)
      bookings.place = place
      bookings.price = place.price
      bookings.total = place.price * days
      bookings.save

      flash[:notice] = "booking success"
    # end
    redirect_to place
  end

  def booking_params
    params.require(:booking).permit(:place_id, :start_time, :end_time)
  end
end
