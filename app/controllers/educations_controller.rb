class EducationsController < ApplicationController
  before_action :authenticate_user
  before_action :find_education, only: [:edit, :update, :destroy]


  def new
    @education = Education.new
  end

  def create
    @education = Education.new education_params
    @education.user = current_user
    if @education.save
      redirect_to current_user, notice: "New education successfully added."
    else
      render :new, alert: "Education creation failed."
    end
  end

  def edit
  end

  def update
    @education.update education_params
    redirect_to current_user, notice: "Education successfully updated."
  end

  def destroy
    @education.destroy
    redirect_to current_user, notice: "Education deleted."
  end


  private

  def find_education
    @education = Education.find params[:id]
  end

  def education_params
    params.require(:education).permit(:start_date, :end_date, :institution, :program,
                                      :url, :image, :description)
  end

end
