class ExperiencesController < ApplicationController
  before_action :authenticate_user
  before_action :find_experience, only: [:edit, :update, :destroy]

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new experience_params
    @experience.user = current_user
    if @experience.save
      redirect_to current_user, notice: "New experience successfully added."
    else
      render :new, alert: "Experience creation failed."
    end
  end

  def edit
  end

  def update
    @experience.update experience_params
    redirect_to current_user, notice: "Experience successfully updated."
  end

  def destroy
    @experience.destroy
    redirect_to current_user, notice: "Experience deleted."
  end


  private

  def find_experience
    @experience = Experience.find params[:id]
  end

  def experience_params
    params.require(:experience).permit(:title, :description, :company, :url,
                                       :start_date, :end_date)
  end

end
