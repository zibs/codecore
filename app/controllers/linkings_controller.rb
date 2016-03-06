class LinkingsController < ApplicationController

  def index
    @linkings = current_user.linkings
    @linking = Linking.new
  end

  def create
    @like = Link.find params[:linking][:link_id]
    @linking = Linking.new(user: current_user, link: @like, url: params[:linking][:url])
    respond_to do |format|
      if @linking.save
        #format.html { render json: params}
        format.html { redirect_to user_linkings_path, notice: "Link created!" }
        format.js   { render :success_linking }
      else
        format.html { redirect_to reuser_linkings_path, alert: "Error: Link was not created." }
        format.js { render :fail_linking }
      end

    end
  end

  def destroy
    @linking = current_user.linkings.find params[:id]
    @linking.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: "Link deleted!" }
      format.js   { render }
    end
  end
end
