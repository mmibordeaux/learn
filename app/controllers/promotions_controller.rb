class PromotionsController < ApplicationController
  before_action :set_promotion, only: [:show, :edit, :update, :destroy]

  # GET /promotions
  # GET /promotions.json
  def index
    @promotions = Promotion.all
  end

  # GET /promotions/1
  # GET /promotions/1.json
  def show
  end

  # GET /promotions/new
  def new
    admin_only
    @promotion = Promotion.new
  end

  # GET /promotions/1/edit
  def edit
    admin_only
  end

  # POST /promotions
  # POST /promotions.json
  def create
    admin_only
    @promotion = Promotion.new(promotion_params)
    flash[:notice] = 'Promotion was successfully created.' if @promotion.save
    respond_with @promotion
  end

  # PATCH/PUT /promotions/1
  # PATCH/PUT /promotions/1.json
  def update
    admin_only
    flash[:notice] = 'Promotion was successfully updated.' if @promotion.update(promotion_params)
    respond_with @promotion
  end

  # DELETE /promotions/1
  # DELETE /promotions/1.json
  def destroy
    admin_only
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
