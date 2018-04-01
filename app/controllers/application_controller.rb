class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :detect_device_variant

  private

  def detect_device_variant
    request.variant = :tablet if browser.device.tablet?
    request.variant = :desktop if !browser.device.mobile? && !browser.device.tablet?
  end
end
