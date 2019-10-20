class DashboardController < ApplicationController
  def index
    @student = current_student
    @title = "Bonjour, #{@student}"
    @subtitle = @student.promotion.to_s
  end

  def me
    @student = current_student
    @title = 'Mon profil'
    add_breadcrumb @title
  end

  def update_me
    @student = current_student
    flash[:notice] = 'Profil mis à jour' if @student.update(student_params)
    @student.sync_profile!
    redirect_to :root
  end

  private

  def student_params
    params.require(:student).permit(:firstname, :lastname, :codeschool, :codecademy, :pluralsight, :promotion_id, :github_identifier, :github_repository, :heroku_app)
  end

end
