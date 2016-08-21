class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_student!
  before_filter :authenticate
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :firstname
    devise_parameter_sanitizer.for(:sign_up) << :lastname
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['HTTP_USER'] && password == ENV['HTTP_PASS']
    end if Rails.env.production?
  end
end
