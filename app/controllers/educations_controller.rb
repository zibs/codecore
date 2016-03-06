class EducationsController < ApplicationController
  before_action :authenticate_user
  before_action :find_education, only: [:edit, :update, :destroy]


  def new
    @education = Education.new
  end

  def create
    @education = Education.new education_params
    @education.user = current_user
    respond_to do |format|
    if @education.save
      format.html {redirect_to current_user, notice: "New education successfully added."}
      format.js {render :create_success}
    else
      format.html {render :new, alert: "Education creation failed."}
      format.js {render :create_fail}
    end
    end
  end

  def edit
    respond_to do |format|
      format.js {render :update}
    end
  end

  def update
    @education.update education_params
    respond_to do |format|
    format.html {redirect_to current_user, notice: "Education successfully updated."}
    format.js {render :update_success}
    end
  end

  def destroy
    @education.destroy
    respond_to do |format|
      format.html {redirect_to current_user, notice: "Education deleted."}
      format.js {render}
    end
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
