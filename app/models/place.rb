class Place < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :bookings
  has_many :tags
  accepts_nested_attributes_for :photos
  accepts_nested_attributes_for :tags

  validates :name, presence: true, length: {maximum: 75}
  validates :description, presence: true, length: {maximum: 600}
  validates :photos, presence: true
  validates :category, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :area, numericality: { only_integer: true, greater_than: 0, less_than: 1000 }
  validates :exposure, numericality: { only_integer:true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :price, numericality: { only_integer: true, greater_than: 0, less_than: 10000 }
end
