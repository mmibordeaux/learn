class Admin::PromotionsController < Admin::ApplicationController
  before_action :set_promotion, only: [:show, :edit, :update, :destroy, :sync]

  respond_to :html

  def index
    @promotions = Promotion.all
  end

  def show
  end

  def new
    @promotion = Promotion.new
  end

  def edit
  end

  def sync
    @promotion.sync_projects
    redirect_to admin_promotion_path(@promotion)
  end

  def create
    @promotion = Promotion.create promotion_params
    respond_with :admin, @promotion
  end

  def update
    @promotion.update promotion_params
    respond_with :admin, @promotion
  end

  def destroy
    @promotion.destroy
    respond_with :admin, @promotion
  end

  private
  
  def set_promotion
    @promotion = Promotion.find(params[:id]) if params.include? :id
    @promotion = Promotion.find(params[:promotion_id]) if params.include? :promotion_id
  end

  def promotion_params
    params.require(:promotion).permit(:name, :year)
  end
end
