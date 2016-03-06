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
    @user = current_user
    respond_to do |format|
      if @project.save
        format.html { redirect_to current_user, notice: "New Project Successfully Added." }
        format.js { render :project_create_success }
      else
        format.html { render :new, alert: "Project Creation Failed." }
        format.js { render :project_create_failure }
      end
    end
  end

  def edit
    @user = current_user
    respond_to do |format|
      format.js { render :edit_project }
    end
  end

  def update
    @user = current_user
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to current_user, notice: "Project Successfully Updated." }
        format.js { render :update_project_success }
      else
        format.js { render :update_project_failure }
      end
    end
  end

  def destroy
    respond_to do |format|
      @project.destroy
      format.html { redirect_to current_user, notice: "Project deleted." }
      format.js { render }
    end
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
