class Admin::AchievementsController < Admin::ApplicationController
  before_action :set_achievement, only: [:show, :edit, :update, :destroy]

  respond_to :html

  add_breadcrumb 'Projets', :admin_courses_path

  def index
    @achievements = Achievement.all
  end

  def show
    add_breadcrumb @achievement.course, [:admin, @achievement.course]
    add_breadcrumb @achievement
  end

  def new
    @achievement = Achievement.new
  end

  def edit
    add_breadcrumb @achievement.course, [:admin, @achievement.course]
    add_breadcrumb @achievement, [:admin, @achievement]
    add_breadcrumb 'Modifier'
  end

  def create
    @achievement = Achievement.create achievement_params
    respond_with :admin, @achievement
  end

  def update
    @achievement.update achievement_params
    respond_with :admin, @achievement
  end

  def destroy
    @achievement.destroy
    respond_with :admin, @achievement
  end

  private

  def set_achievement
    @achievement = Achievement.find(params[:id])
  end

  def achievement_params
    params.require(:achievement).permit(:title, :text, :position, :points, :identifier, :why, :how, :kind, :course_id)
  end
end
