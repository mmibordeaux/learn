class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_student!
  before_action :configure_permitted_parameters, if: :devise_controller?

  respond_to :html

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :promotion_id])
  end

  def admin_only
    raise ActionController::RoutingError, 'Forbidden' unless current_student.admin
  end
end
