class SkillsController < ApplicationController
  before_action :authenticate_user
  before_action :find_skill, only: [:edit, :update, :destroy]

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new skill_params
    @skill.user = current_user
    if @skill.save
      redirect_to current_user, notice: "New skill successfully added."
    else
      render :new, alert: "Skill creation failed."
    end
  end

  def edit
  end

  def update
    @skill.update skill_params
    redirect_to current_user, notice: "Skill successfully updated."
  end

  def destroy
    @skill.destroy
    redirect_to current_user, notice: "Skill deleted."
  end


  private

  def find_skill
    @skill = Skill.find params[:id]
  end

  def skill_params
    params.require(:skill).permit(:title, :level)
  end

end
