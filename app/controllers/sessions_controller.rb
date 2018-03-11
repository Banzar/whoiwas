class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to current_user
      flash[:notice] = "You are already signed in."
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
    end
  end

  def destroy	
    user = current_user
    session[:user_id] = nil
    redirect_to root_path
  end
end