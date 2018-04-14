class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :assistance_needed
  include SessionsHelper

  def assistance_needed
  	if logged_in?
	  	@helps = AssistMessage.where(completed: [false, nil])
	  	@helps_count = AssistMessage.where(completed: [false, nil]).count
	  	@helped = AssistMessage.where(completed: [true])
	  	@user_messages = AssistMessage.where(user_id: [current_user.id])
	  	if @user_messages.present?
	  		#@unread = AssistMessage.where(user_id: [current_user.id]) && AssistMessage.where(completed: [true]) && AssistMessage.where(read: [false])
	  		@unread = @user_messages.where(read: [false]) & @user_messages.where(completed: [true])
	  	end
	  end
  end
end
