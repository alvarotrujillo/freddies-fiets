class PagesController < ApplicationController
  def home
  end

  def account
    @user_bikes = Bike.where(bike.user == user)
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :bike_type, :location, :description, :gears, :photo, :hand_brake, :price, :active)
  end
end
