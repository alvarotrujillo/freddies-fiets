class BikesController < ApplicationController
  def index
    @bikes = Bike.where(active: true)
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
      redirect_to bike_path(@bike)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def update
    @bike = Bike.find(params[:id])
    @bike.update(bike_params)
    redirect_to bike_path(@bike)
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :bike_type, :location, :description, :gears, :photo, :hand_brake, :price, :active)
  end
end
