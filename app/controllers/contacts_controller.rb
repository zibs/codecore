class ContactsController < ApplicationController
  before_action :find_user, only: [:new, :create]

  def new
  end

  def create
    email = params[:contact][:email]
    name = params[:contact][:name]
    message = params[:contact][:message]
    UsersMailer.contact_user(@user, name, email, message).deliver_later
    redirect_to user_path(@user), flash: { success: "Message Sent" }
  end

  private

    def find_user
      @user = User.find(params[:user_id])
    end

end
