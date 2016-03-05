class AdminController < ApplicationController
  before_action :authenticate_admin

  def index
    @invalid_users = User.where(legit: false)
  end

end
