class Admin::PromotionsController < Admin::ApplicationController
  before_action :set_promotion

  add_breadcrumb 'Promotions', :admin_promotions_path

  respond_to :html

  def index
    @promotions = Promotion.all
    @title = 'Promotions'
  end

  def show
    @title = @promotion.to_s
    add_breadcrumb @title
  end

  def new
    @promotion = Promotion.new
    @title = 'Nouvelle promotion'
    add_breadcrumb @title
  end

  def edit
    @title = "#{@promotion} - Modifier"
    add_breadcrumb @promotion, [:admin, @promotion]
    add_breadcrumb 'Modifier'
  end

  def sync_courses
    @promotion.sync_courses!
    redirect_to admin_promotion_path(@promotion)
  end

  def evaluations
    @title = 'Evaluations'
    add_breadcrumb @promotion, [:admin, @promotion]
    add_breadcrumb @title
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
    params.require(:promotion).permit(:name, :year, :students_csv)
  end
end
