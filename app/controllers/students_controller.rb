class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :sync]
  before_action :admin_only, except: [:index, :show]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.create student_params
    respond_with @student
  end

  def update
    @student.update student_params
    respond_with @student
  end

  def destroy
    @student.destroy
    respond_with @student
  end

  def sync
    @student.sync!
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render text: 'ok' }
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:firstname, :lastname, :codeschool, :codecademy, :promotion_id, :github_identifier, :github_repository, :heroku_app)
  end
end
