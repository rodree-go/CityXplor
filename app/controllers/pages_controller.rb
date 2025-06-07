class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @experiences = Experience.limit(3)
    @reviews = Review.limit(3)
  end

  def dashboard
    @user = current_user
    @hosted_experiences = Experience.where(host: @user)
    @hosted_reviews = Review.where(experience: @hosted_experiences).limit(3)
    @booked_experiences = Booking.where(user_id: @user)
    @user_reviews = Review.where(user: @user).limit(3)
  end
end
