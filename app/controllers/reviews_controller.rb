class ReviewsController < ApplicationController
  
  before_action :set_experience

  def create
    @review = @experience.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @experience, notice: 'Review was successfully created'
    else
      redirect_to experience_path(@experience), alert: 'Error creating review'
    end
  end

  def destroy
    @review = @experience.reviews.find(params[:id])
    if @review.user == current_user
      @review.destroy
      redirect_to @experience, notice: 'Review was successfully deleted'
    else
      redirect_to @experience, alert: 'You can only delete your own reviews'
    end
  end

  private

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
