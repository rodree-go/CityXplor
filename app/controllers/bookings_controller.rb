class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
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
end
