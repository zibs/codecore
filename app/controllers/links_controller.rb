class LinksController < ApplicationController

  def create
    linking = Linking.new(user: current_user, link: params[:link], url: params[:url])
  end

  def destroy
  end

end
