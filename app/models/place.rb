class Place < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :bookings
  has_many :tags
  accepts_nested_attributes_for :photos
  accepts_nested_attributes_for :tags
  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true, length: {maximum: 75}
  validates :description, presence: true, length: {maximum: 600}
  validates :photos, presence: true
  validates :category, presence: true
  validates :address, presence: true
  validates :area, numericality: { only_integer: true, greater_than: 0, less_than: 1000 }
  validates :exposure, numericality: { only_integer:true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :price, numericality: { only_integer: true, greater_than: 0, less_than: 10000 }

  scope :min_exposure, lambda { |min|
    where('exposure >= ?', min)
  }
  scope :max_exposure, lambda { |max|
    where('exposure <= ?', max)
  }
  scope :min_price, lambda { |min|
    where('price >= ?', min)
  }
  scope :max_price, lambda { |max|
    where('price <= ?', max)
  }
  scope :category, lambda { |category|
    where(category: category)
  }
  scope :location, lambda { |location|
    near(location, 50, :units => :km, :order => 'distance')
  scope :between, lambda { |params|
    joins(:bookings)
      .where(
        '? BETWEEN bookings.start_time AND bookings.end_time OR ? BETWEEN bookings.start_time AND bookings.end_time',
        params[:start_time], params[:end_time]
      )
  }
end
