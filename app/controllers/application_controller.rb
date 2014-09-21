class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['HTTP_USER'] && password == ENV['HTTP_PASS']
    end if Rails.env.production?
  end
end
