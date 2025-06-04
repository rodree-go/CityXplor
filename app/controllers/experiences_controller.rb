class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
    @reviews = @experience.reviews
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.host = current_user
    if @experience.save
      redirect_to @experience, notice: 'Experience was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def experience_params
    params.require(:experience).permit(:category, :title, :location, :description, :rating, :price)
  end
end
