class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :user

  # validates :bike_id
end
