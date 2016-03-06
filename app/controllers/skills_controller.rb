class SkillsController < ApplicationController
  before_action :authenticate_user
  before_action :find_skill, only: [:edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def new
    @skill = Skill.new(user_id: params[:user_id])
    authorize_user
  end

  def create
    @skill = Skill.new skill_params
    @skill.user = current_user
    authorize_user
    @user = current_user
    respond_to do |format|
      if @skill.save
        format.html { redirect_to current_user, notice: "New skill successfully added." }
        format.js { render :skill_create_success }
      else
        format.html { render :new, alert: "Skill creation failed." }
        format.js { render :skill_create_failure }
      end
    end
  end

  def edit
    @user = current_user
    respond_to do |format|
      format.js { render :edit_skill }
    end
  end

  def update
    @user = current_user
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to current_user, notice: "Skill successfully updated." }
        format.js { render :update_skill_success }
      else
        format.js { render :update_skill_failure }
      end
    end
  end

  def destroy
    respond_to do |format|
      @skill.destroy
      format.html { redirect_to current_user, notice: "Skill deleted." }
      format.js { render }
    end
  end

  private

  def find_skill
    @skill = Skill.find params[:id]
  end

  def skill_params
    params.require(:skill).permit(:title, :level)
  end

  def authorize_user
    unless can? :manage, @skill
      redirect_to root_path, alert: "access denied!"
    end
  end
end
