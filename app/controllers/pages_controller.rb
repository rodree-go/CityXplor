class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @experiences = Experience.limit(3)
    @reviews = Review.limit(3)
  end
end
