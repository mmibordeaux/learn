class DashboardController < ApplicationController
  def index
    @student = current_student
  end

  def me
    @student = current_student
  end

  def update_me
    @student = current_student
    flash[:notice] = 'Student was successfully updated.' if @student.update(student_params)
    redirect_to :root
  end

  private
  
  def student_params
    params.require(:student).permit(:firstname, :lastname, :codeschool, :codecademy, :promotion_id, :github_identifier, :github_repository, :heroku_app)
  end

end