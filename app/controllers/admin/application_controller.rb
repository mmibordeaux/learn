class Admin::ApplicationController < ApplicationController
  before_action :admin_only

  def admin_only
    raise ActionController::RoutingError, 'Forbidden' unless current_student.admin
  end
end