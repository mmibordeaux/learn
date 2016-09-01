class DashboardController < ApplicationController
  def index
    @student = current_student
  end
end