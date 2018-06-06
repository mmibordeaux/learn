class CoursesController < ApplicationController
  def show
    @course = Course.find params[:id]
  end

  def evaluate
    @course = Course.find params[:course_id]
    @evaluation = Evaluation.where(student: current_student, course: @course).first_or_create
  end

  def update_evaluation
    @course = Course.find params[:course_id]
    @evaluation = Evaluation.where(student: current_student, course: @course).first
    @evaluation.update evaluation_params
    redirect_to @course, notice: 'Evaluation mise à jour.'
  end

  protected

  def evaluation_params
    params.require(:evaluation).permit(:comment, :relevant_content, :content_to_add, :content_to_remove, :quality, :technical_skills_acquired, :soft_skills_acquired, :knowledge_acquired)
  end
end
