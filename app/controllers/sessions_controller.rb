class SessionsController < ApplicationController

def new
end

def create
  user = User.find_by(email: params[:session][:email])
  if user && user.authenticate(params[:session][:password]) && user.legit
    sign_in(user)
    redirect_to(root_path, flash: { success: "Signed in :)"})
  elsif user && !user.legit
    flash[:alert] = "Please wait for validation from admin."
    render :new
  else
    flash[:danger] = "Wrong credentials!"
    render :new
  end

end

def destroy
  session[:user_id] = nil
  redirect_to root_path, flash: { warning:  "Logged out" }
end

end
