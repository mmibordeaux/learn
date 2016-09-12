class AchievementsController < ApplicationController
  before_action :set_achievement, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, except: :show

  def index
    @achievements = Achievement.all
  end

  def show
  end

  def new
    @achievement = Achievement.new
  end

  def edit
  end

  def create
    @achievement = Achievement.create achievement_params
    respond_with @achievement
  end

  def update
    @achievement.update achievement_params
    respond_with @achievement
  end

  def destroy
    @achievement.destroy
    respond_with @achievement
  end

  private

  def set_achievement
    @achievement = Achievement.find(params[:id])
  end

  def achievement_params
    params.require(:achievement).permit(:title, :text, :position, :points, :identifier, :why, :how)
  end
end
