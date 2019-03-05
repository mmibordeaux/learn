class Api::ProjectsController < Api::ApplicationController
  def show
    courses = Course.where(teach_project_id: params[:teach_project_id])
    evaluations = Evaluation.where(course: courses)
    render json: {
      evaluations: evaluations.count,
      quality: evaluations.average(:quality).to_f.round(2),
      knowledge_acquired: evaluations.average(:knowledge_acquired).to_f.round(2),
      technical_skills_acquired: evaluations.average(:technical_skills_acquired).to_f.round(2),
      soft_skills_acquired: evaluations.average(:soft_skills_acquired).to_f.round(2),
      relevant_content: evaluations.collect(&:relevant_content).reject {|e| e.blank?},
      content_to_add: evaluations.collect(&:content_to_add).reject {|e| e.blank?},
      content_to_remove: evaluations.collect(&:content_to_remove).reject {|e| e.blank?},
      comment: evaluations.collect(&:comment).reject {|e| e.blank?}
    }
  end
end