class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def new
    @bike = Bike.new
  end

def categories
  @categories = ['City bike', 'Road bike', 'BMX bike', 'Cargo bike', 'Mountain bike', 'Single-speed bike', 'Fixie bike']
end

  def filter
    @bike_type_query = params[:bike_type]
    @bikes = Bike.where(bike_type: @bike_type_query)
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user

    if @bike.save
      redirect_to bikes_index_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :bike_type, :location, :description, :gears, :photo, :hand_brake, :price, :active)
  end
end
