class StudentsController < ApplicationController
  respond_to :html, :json
  before_action :set_student, only: [:show, :edit, :update, :destroy, :sync]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    admin_only
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    admin_only
  end

  # POST /students
  # POST /students.json
  def create
    admin_only
    @student = Student.new(student_params)
    flash[:notice] = 'Student was successfully created.' if @student.save
    respond_with @student
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    admin_only
    flash[:notice] = 'Student was successfully updated.' if @student.update(student_params)
    respond_with @student
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    admin_only
    @student.destroy
    respond_with @student
  end

  def sync
    admin_only
    @student.sync!
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render text: 'ok' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:firstname, :lastname, :codeschool, :codecademy, :promotion_id, :github_identifier, :github_repository, :heroku_app)
    end
end
