class BookingsController < ApplicationController
  before_action :authenticate_user!

  def my_bookings
    @bookings = Booking.where(user_id: current_user.id)
  end

  def index
    @bookings = Booking.where(place_id: params[:place_id])
  end

  def new
    @booking = Booking.new
    @place = Place.find(params[:place_id])
  end

  def create
    place = Place.find(params[:place_id])
    if current_user == place.user
      flash[:alert] = "You can't book your own room #nicetry"
    else
      start_time = DateTime.parse(booking_params[:start_time])
      end_time = DateTime.parse(booking_params[:end_time])

      if end_time < start_time
        flash[:alert] = "Your end time is before your start time 🤦‍"
      else
        if start_time < DateTime.now
          flash[:alert] = "Your start time is before today 🤦‍"
        else
          booked = Place.between( { start_time: start_time, end_time: end_time } );
          available = Place.where.not(id: booked).exists?

          if available
            bookings = current_user.bookings.build(booking_params)
            bookings.start_time = start_time
            bookings.end_time = end_time
            bookings.place = place
            bookings.save

            flash[:notice] = "Your booking is confirmed! 👍"
          else
            puts "Sorry, this slot is already booked 🙁"
          end
        end
      end
    end
    redirect_to place
  end

  def booking_params
    params.require(:booking).permit(:place_id, :start_time, :end_time)
  end
end
