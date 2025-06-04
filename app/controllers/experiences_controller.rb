class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
    @reviews = @experience.reviews
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
