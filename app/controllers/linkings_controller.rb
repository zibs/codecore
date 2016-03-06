class LinkingsController < ApplicationController
  def index
    @linkings = current_user.linkings
    @linking = Linking.new
  end

  def create
    @like = Link.find params[:linking][:link_id]
    @linking = Linking.new(user: current_user, link: @like, url: params[:linking][:url])
    # authorize_user
    respond_to do |format|
      if @linking.save
        #format.html { render json: params}
        format.html { redirect_to user_linkings_path, notice: "Link created!" }
        format.js   { render :create_success }
      else
        format.html { redirect_to user_linkings_path, alert: "Error: Link was not created." }
        format.js { render :create_fail }
      end
    end
  end

  def edit
    @user = current_user
    @linking = Linking.find(params[:id])
    respond_to do |format|
      format.js { render :edit_link }
    end
  end

  def update
    @user = current_user
    @linking = Linking.find(params[:id])
    respond_to do |format|
      if @linking.update(linking_params)
        format.html { redirect_to current_user, notice: "Skill successfully updated." }
        format.js { render :update_link_success }
      else
        format.js { render :update_link_failure }
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

  private

  def authorize_user
    unless can? :manage, @linking
      flash[:alert] = "access denied!"
      redirect_to root_path and return
    end
  end

  def linking_params
    params.require(:linking).permit(:url, :link_id)
  end


end
