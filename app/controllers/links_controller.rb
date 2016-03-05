class LinksController < ApplicationController

  def index
    @linkings = current_user.linking
    @linking = Linking.new
  end

  def create
    linking = Linking.new(user: current_user, link: params[:link], url: params[:url])
    if link.save
      redirect_to user_path(current_user), notice: "Link created!"
    else
      redirect_to user_path(current_user), alert: "Error: Link was not created."
    end
  end

  def destroy
    link = current_user.links.find params[:id]
    link.destroy
    redirect_to user_path(current_user), notice: "Link deleted!"
  end

end
