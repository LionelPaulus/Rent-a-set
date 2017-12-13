class Booking < ApplicationRecord
  # validates_with ReservationDateValidator

  belongs_to :user
  belongs_to :place

  validates :start_time, presence: true
  validates :end_time, presence: true

  # before_save :calculate_total_price

  # def calculate_total_price
  #   self.total = duration_days * room.price
  # end
  #
  # def duration_days
  #   (end_time.end_of_day.to_date - start_time.beginning_of_day.to_date).to_i
  # end
end
