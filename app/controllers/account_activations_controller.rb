class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.increment!(:legacy_count)
      user.update_attribute(:activated,    true)
      user.update_attribute(:activated_at, Time.zone.now)
      log_in user
      flash[:notice] = "Account activated!"
      redirect_to user
    else
      flash[:notice] = "Invalid activation link"
      redirect_to root_url
    end
  end
end