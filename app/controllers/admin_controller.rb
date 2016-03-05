class AdminController < ApplicationController

  def index
    @invalid_users = User.where(legit: false)
  end
  
end
