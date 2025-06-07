class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.new
  end

  def create
    raise
  end

  def show
    # @booking = Booking.find(params[:id])
    # @experience = @booking.experience
  end

  def edit
  end

  def update
    # @booking = Booking.find(params[:id])

  end

  def destroy
    # @booking = Booking.find(params[:id])

  end

  # private
  # def booking_params
  #   params.require(:)
  # end

end
