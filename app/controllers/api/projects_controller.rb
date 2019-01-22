class Api::ProjectsController < Api::ApplicationController
  def show
    @course = Course.where(teach_project_id: params[:teach_project_id]).last
  end
end