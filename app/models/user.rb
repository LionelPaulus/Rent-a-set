class User < ApplicationRecord
  has_many :set
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true, length: {maximum: 65}
  validates :last_name, presence: true, length: {maximum: 65}

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                             default_url: '/assets/default_image.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
