class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def new
    @bike = Bike.new
  end

  def create
    @user = User.find([:id])
    @bike = Bike.new(bike_params)
    @bike.user = @user

    if @bike.save
      redirect_to bikes_index_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :type, :location, :description, :gears, :hand_brake, :price, :active)
  end
end
