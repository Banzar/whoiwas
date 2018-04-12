class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :assistance_needed
  include SessionsHelper

  def assistance_needed
  	@helps = AssistMessage.where(completed: [false, nil])
  	@helps_count = AssistMessage.where(completed: [false, nil]).count
  end
end
