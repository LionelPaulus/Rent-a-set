class User < ApplicationRecord
  has_many :set
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true, length: {maximum: 65}
  validates :last_name, presence: true, length: {maximum: 65}
end
