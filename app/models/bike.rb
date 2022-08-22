class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  # to be added to the form  <%= f.input :photo, as: :file %>
    # def article_params
      # params.require(:article).permit(:title, :body, :photo)
    # end


  validates :name, presence: true
  validates :type, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
