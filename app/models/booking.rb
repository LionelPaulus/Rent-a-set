class Booking < ApplicationRecord
  before_save :calculate_price

  belongs_to :user
  belongs_to :place

  validates :start_time, presence: true
  validates :end_time, presence: true

  def self.between(start_time, end_time)
    where(
      '? BETWEEN bookings.start_time AND bookings.end_time OR ? BETWEEN bookings.start_time AND bookings.end_time',
      start_time, end_time
    )
  end

private
  def calculate_price
    hours = TimeDifference.between(self.start_time, self.end_time).in_hours
    self.price = self.place.price
    hourly_price = self.place.price / 24.0
    self.total = (hourly_price * hours).round(2)
  end
end
