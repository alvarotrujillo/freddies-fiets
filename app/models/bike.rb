class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :type, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
