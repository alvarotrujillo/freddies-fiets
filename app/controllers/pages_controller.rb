class PagesController < ApplicationController
  def home
  end

  def account
    if !user_signed_in?
      redirect_to root_path, notice: "Please, sign in"
    end

    @user_bikes = Bike.where(user: current_user)
    @user_bookings = Booking.where(user: current_user)
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :bike_type, :location, :description, :gears, :photo, :hand_brake, :price, :active)
  end
end


User.where("name = :name and email = :email", { name: "Joe", email: "joe@example.com" })
