class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username, :avatar ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :username, :avatar ])
  end
end
