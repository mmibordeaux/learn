class Admin::StudentsController < Admin::ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :sync]

  respond_to :html

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
    respond_with :admin, @student
  end

  def update
    @student.update student_params
    respond_with :admin, @student
  end

  def destroy
    @student.destroy
    respond_with :admin, @student
  end

  def sync
    @student.sync!
    respond_to do |format|
      format.html { redirect_back(fallback_location: @student) }
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
