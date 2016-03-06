class ProjectsController < ApplicationController
  before_action :authenticate_user
  before_action :find_project, only: [:edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def new
    @project = Project.new(user_id: params[:user_id])
    authorize_user
  end

  def create
    @project = Project.new project_params
    @project.user = current_user
    authorize_user
    if @project.save
      redirect_to current_user, notice: "New project successfully added."
    else
      render :new, alert: "Project creation failed."
    end
  end

  def edit
  end

  def update
    @project.update project_params
    redirect_to current_user, notice: "Project successfully updated."
  end

  def destroy
    @project.destroy
    redirect_to current_user, notice: "Project deleted."
  end


  private

  def find_project
    @project = Project.find params[:id]
  end

  def project_params
    params.require(:project).permit(:title, :description, :url, :image, :github)
  end

  def authorize_user
    unless can? :manage, @project
      redirect_to root_path, alert: "access denied!"
    end
  end

end
