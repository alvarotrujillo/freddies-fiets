class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  # to be added to the form  <%= f.input :photo, as: :file %>
    # def article_params
      # params.require(:article).permit(:title, :body, :photo)
    # end


  CATEGORIES = ['City bike', 'Road bike', 'BMX bike', 'Cargo bike', 'Mountain bike', 'Single-speed bike', 'Fixie bike']
  GEARS = ['No gears', '3', '7', '18', '21', '28']

  validates :name, presence: true
  validates :bike_type, presence: true, inclusion: { in: CATEGORIES }
  validates :location, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :gears, inclusion: { in: GEARS }
end
