class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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
    @experience = Experience.find(params[:id])

  end

  def update
    @experience = Experience.find(params[:id])
    if @experience.update(experience_params)
      redirect_to @experience
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to experiences_path status: :see_other
  end

  private

  def experience_params
    params.require(:experience).permit(:category, :title, :location, :description, :price, :seats, :start_time, :end_time)
  end
end
