class AchievementsController < ApplicationController
  before_action :set_achievement, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @achievements = Achievement.all
    respond_with(@achievements)
  end

  def show
    respond_with(@achievement)
  end

  def new
    admin_only
    @achievement = Achievement.new
    respond_with(@achievement)
  end

  def edit
    admin_only
  end

  def create
    admin_only
    @achievement = Achievement.new(achievement_params)
    @achievement.save
    respond_with(@achievement)
  end

  def update
    admin_only
    @achievement.update(achievement_params)
    respond_with(@achievement)
  end

  def destroy
    admin_only
    @achievement.destroy
    respond_with(@achievement)
  end

  private
    def set_achievement
      @achievement = Achievement.find(params[:id])
    end

    def achievement_params
      params.require(:achievement).permit(:title, :text, :position, :points, :identifier, :why, :how)
    end
end
