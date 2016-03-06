class ExperiencesController < ApplicationController
  before_action :authenticate_user
  before_action :find_experience, only: [:edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def new
    @experience = Experience.new(user_id: params[:user_id])
    authorize_user
  end

  def create
    @experience = Experience.new experience_params
    @experience.user = current_user
    authorize_user
    @user = current_user
    respond_to do |format|
      if @experience.save
        format.html { redirect_to current_user, notice: "New Experience successfully added." }
        format.js { render :experience_create_success }
      else
        format.html { render :new, alert: "Experience creation failed." }
        format.js { render :experience_create_failure }
      end
    end
  end

  def edit
    @user = current_user
    respond_to do |format|
      format.js { render :edit_experience }
    end
  end

  def update
    @user = current_user
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to current_user, notice: "Experience successfully updated." }
        format.js { render :update_experience_success }
      else
        format.js { render :update_experience_failure }
      end
    end
  end

  def destroy
    respond_to do |format|
      @experience.destroy
      format.html { redirect_to current_user, notice: "Experience deleted." }
      format.js { render }
    end
  end


  private

  def find_experience
    @experience = Experience.find params[:id]
  end

  def experience_params
    params.require(:experience).permit(:title, :description, :company, :url,
                                       :start_date, :end_date)
  end
  def authorize_user
    unless can? :manage, @experience
      flash[:alert] = "access denied!"
      redirect_to root_path and return
    end
  end
end
