class Api::PromotionsController < Api::ApplicationController
  def show
    @promotion = Promotion.find_by year: params[:year]
    @courses = @promotion.courses.done
  end
end