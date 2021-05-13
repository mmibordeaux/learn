class Admin::CoursesController < Admin::ApplicationController
  before_action :set_course, only: [:show, :evaluations, :edit, :update, :destroy]

  add_breadcrumb 'Projets', :admin_courses_path

  def index
    @courses = Course.unscoped.order(starting_at: :desc)
    @title = 'Projets'
  end

  def show
    @title = @course.to_s
    add_breadcrumb @title
  end

  def evaluations
    @title = "#{@course} - Evaluations"
    @evaluations = @course.evaluations
    @quality = @evaluations.average(:quality)
    @knowledge_acquired = @evaluations.average(:knowledge_acquired)
    @technical_skills_acquired = @evaluations.average(:technical_skills_acquired)
    @soft_skills_acquired = @evaluations.average(:soft_skills_acquired)
    @relevant_content = @evaluations.pluck(:relevant_content).reject(&:blank?)
    @content_to_add = @evaluations.pluck(:content_to_add).reject(&:blank?)
    @content_to_remove = @evaluations.pluck(:content_to_remove).reject(&:blank?)
    @comment = @evaluations.pluck(:comment).reject(&:blank?)
    add_breadcrumb @course.to_s, [:admin, @course]
    add_breadcrumb 'Evaluations'
  end

  def new
    @course = Course.new
    @title = 'Nouveau projet'
    add_breadcrumb @title
  end

  def edit
    @title = "#{@course} - Modifier"
    add_breadcrumb @course.to_s, [:admin, @course]
    add_breadcrumb 'Modifier'
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to [:admin, @course], notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  def update
    if @course.update(course_params)
      redirect_to [:admin, @course], notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to admin_courses_url, notice: 'Course was successfully destroyed.'
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :description, :promotion_id)
  end
end
