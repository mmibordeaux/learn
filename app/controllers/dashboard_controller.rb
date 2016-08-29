class DashboardController < ApplicationController
  def index
  	@student = current_student
  	@student.sync!
  end
end