class BikesController < ApplicationController
  def index
    @bikes = Bike.where(active: true)
  end

  def near_me
    @bikes = Bike.near(current_user.address, 15)
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        info_window: render_to_string(partial: "info_window", locals: {bike: bike}),
        image_url: helpers.asset_url("freddiefiets.png")
      }
    end
  end

  def new
    @bike = Bike.new
  end

  def categories
    @categories = ['City bike', 'Road bike', 'BMX bike', 'Cargo bike', 'Mountain bike', 'Fixie bike']
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

  def change
    @bike = Bike.find(params[:id])
    @bike.active = !@bike.active
    @bike.save
    redirect_to account_path
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :bike_type, :location, :description, :gears, :photo, :hand_brake, :price, :active)
  end
end
