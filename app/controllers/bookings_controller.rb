class BookingsController < ApplicationController
  def index
    @myBookings = Booking.where(user: current_user).order(:start_date)
  end

  def new
    if !user_signed_in?
      redirect_to new_user_session_path, notice: "Please, sign in"
    end
    @booking = Booking.new
    @bike = Bike.find(params[:bike_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.bike = Bike.find(params[:bike_id])

    # @booking.save!


    if @booking.save!
      redirect_to bookings_path
    end

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
