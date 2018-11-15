class Api::ProjectsController < Api::ApplicationController
  def show
    @course = Course.find_by teach_project_id: params[:teach_project_id]
  end
end