class PromotionsController < ApplicationController
  before_action :set_promotion, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, except: [:index, :show]

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

  def create
    @promotion = Promotion.create promotion_params
    respond_with @promotion
  end

  def update
    @promotion.update promotion_params
    respond_with @promotion
  end

  def destroy
    @promotion.destroy
    respond_with @promotion
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_promotion
    @promotion = Promotion.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def promotion_params
    params.require(:promotion).permit(:name)
  end
end
