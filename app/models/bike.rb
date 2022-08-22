class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings

  CATEGORIES = ['City bike', 'Road bike', 'Mountain bike']
  GEARS = ['3', '7', '18', '21', '28']

  validates :name, presence: true
  validates :type, presence: true, inclusion: { in: CATEGORIES }
  validates :location, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :gears, inclusion: { in: GEARS }
end
