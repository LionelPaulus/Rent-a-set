class Tag < ApplicationRecord
  belongs_to :place

  validates :name, presence: true, length: {maximum: 20}
end
