class UsersController < ApplicationController
  before_action :authenticate_user, except: [:new, :create, :update]
  before_action :find_user, only: [:show, :edit, :update, :destroy, :update_password]
  before_action :authorize_user, only: [:new, :create, :edit, :update, :destroy]



  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      UsersMailer.notify_user_on_signup(@user).deliver_later
      redirect_to root_path, flash: { success:  "User created" }
    else
      flash[:danger] = "User not created"
      render :new
    end
  end

  def show

  end

  def index
    if params[:who] == "all"
      @users = User.where(hidden: false).page(params[:page]).per(4)
      @title = "All"
    else
      @users = User.where(available: true, hidden: false).page(params[:page]).per(4)
      @title = "Available"
    end
  end

  def edit
    @skill = Skill.new
    @project = Project.new
    @education = Education.new
    @projects = current_user.projects
    @educations = current_user.educations
  end

  def update
    @education = Education.new
    @educations = current_user.educations

    respond_to do |format|
      if @user.update(user_params)
        if user_params[:legit].present?
          UsersMailer.notify_user_on_validation(@user).deliver_later
          format.js { render :legitimate_user}
        else
          format.html { redirect_to root_path, flash: { info:  "User Updated" }}
          format.js { render :create_success }
        end
      else
        format.html{
          flash[:danger] = "nope"
          render :edit
         }
         format.js  { render :create_failure }
        end
      end
    end

  # def edit_password
  #   @user = User.find(params[:id])
  # end
  #
  # def update_password
  #   if (@user.authenticate(user_params[:current_password])) && (user_params[:password] == user_params[:password_confirmation]) && @user.update(password: user_params[:password])
  #     redirect_to root_path, flash: { success: "Project Updated!" }
  #   else
  #     flash[:warning] = "Invalid Combination"
  #     render :edit_password
  #   end
  # end

    private

  def user_params
    params.require(:user).permit([:first_name, :last_name, :email, :password,
                                  :password_confirmation, :current_password,
                                  :description, :image, :available, :legit])
  end

  def find_user
    @user = User.find(params[:id])
  end

  def authorize_user
    unless can? :manage, @user
      redirect_to root_path, alert: "access denied!"
    end
  end

end
