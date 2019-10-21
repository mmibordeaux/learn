class Admin::StudentsController < Admin::ApplicationController
  before_action :set_student

  add_breadcrumb 'Etudiants', :admin_students_path

  respond_to :html

  def index
    @students = Student.all
    @title = 'Etudiants'
  end

  def show
    @title = @student.to_s
    @subtitle = @student.promotion.to_s
    add_breadcrumb @title
  end

  def new
    @student = Student.new
    @title = 'Nouvel étudiant'
    add_breadcrumb @title
  end

  def edit
    @title = "#{@student} - Modifier"
    add_breadcrumb @student.to_s, admin_student_path(@student)
    add_breadcrumb 'Modifier'
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

  def sync_profile
    @student.sync_profile!
    respond_to do |format|
      format.html { redirect_back(fallback_location: @student) }
      format.json { render text: 'ok' }
    end
  end

  private

  def set_student
    @student = Student.find params[:id] if params.include? :id
    @student = Student.find params[:student_id] if params.include? :student_id
  end

  def student_params
    params.require(:student).permit(:firstname, :lastname, :email, :admin, :codeschool, :pluralsight, :codecademy, :promotion_id, :github_identifier, :github_repository, :heroku_app)
  end
end
