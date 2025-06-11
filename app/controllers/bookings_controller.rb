class BookingsController < ApplicationController

  def create
    @booking = Booking.new
    @experience = Experience.find params[:experience_id]
    @booking.experience = @experience
    @booking.guest = current_user
    if @booking.save
      redirect_to @booking
    else
      render "experiences/show", status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @experience = @booking.experience
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to @booking.experience
  end
end
