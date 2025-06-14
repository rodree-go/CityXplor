class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @experiences = Experience.order("RANDOM()").limit(3)
    @reviews = Review.order("RANDOM()").limit(3)
  end

  def dashboard
    @hosted_experiences = Experience.where(host: current_user)
    @hosted_reviews = Review.where(experience: @hosted_experiences).limit(3)
    @booked_experiences = Booking.where(user_id: current_user)
    @user_reviews = Review.where(user: current_user).limit(3)
    @recommended_experiences = Experience.where(rating: 4..5).order('RANDOM()').limit(3)
  end
end
