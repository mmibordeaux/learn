class Api::ProjectsController < Api::ApplicationController
  def show
    @courses = Course.where(teach_project_id: params[:teach_project_id])
    @evaluations = Evaluation.where(course: @courses)
    @agregate = {
      evaluations: @evaluations.count,
      quality: average(:quality).to_f.round(2),
      knowledge_acquired: nil,
      technical_skills_acquired: 0.0,
      soft_skills_acquired: 0.0,
      relevant_content: [],
      content_to_add: [],
      content_to_remove: [],
      comment: []
    }
    # @courses.each do |course|
    #   @agregate[:evaluations] += course.evaluations.count
    #   if @agregate[:quality].nil?
    #     @agregate[:quality] = course.quality
    #   else

    #   end
    # end
    render json: @agregate
  end
end