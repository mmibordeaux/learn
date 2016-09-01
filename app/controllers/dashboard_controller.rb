class DashboardController < ApplicationController
  def index
    @student = current_student
    @student.compute_note
  end
end