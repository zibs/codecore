class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SimpleCaptcha::ControllerHelpers


  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def current_user
    @current_user ||=  User.find(session[:user_id]) if user_signed_in?
  end
  helper_method :current_user

  def sign_in(user)
    session[:user_id] = user.id
  end

  def authenticate_user
    redirect_to new_session_path, flash: {info: "Please sign in :) " } unless user_signed_in?
  end

  def authenticate_admin
    redirect_to root_path, flash: { info: "Page Not Available" } unless current_user.present? && current_user.admin
  end

end
