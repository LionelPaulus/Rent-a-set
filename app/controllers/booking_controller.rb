class BookingController < ApplicationController
  before_action :authenticate_user!
  before_action :find_room, only: [:preload, :preview]

  # def create
  #   @reservation = current_user.reservations.create(reservation_params)
  #   redirect_to @reservation.room, notice: "Votre réservation est confirmée"
  # end
  #
  # def preload
  #   today = Date.today
  #   reservations = @room.reservations.where("start_date >= ? OR end_date >= ?", today, today)
  #   render json: reservations
  # end
  #
  # def preview
  #   start_date = Date.parse(params[:start_date])
  #   end_date = Date.parse(params[:end_date])
  # end
  #
  # private
  #
  # def reservation_params
  #   params.require(:reservation)
  #     .permit(:start_date)
end
