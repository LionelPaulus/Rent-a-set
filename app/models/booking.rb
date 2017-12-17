class Booking < ApplicationRecord
  before_save :calculate_price

  belongs_to :user
  belongs_to :place

  validates :start_time, presence: true
  validates :end_time, presence: true

private
  def calculate_price
    hours = TimeDifference.between(self.start_time, self.end_time).in_hours
    self.price = self.place.price
    hourly_price = self.place.price / 24.0
    self.total = (hourly_price * hours).round(2)
  end
end
