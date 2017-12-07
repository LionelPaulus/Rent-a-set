class Place < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  has_many :bookings
end
