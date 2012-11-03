class DealsController < ApplicationController
  before_filter :find_business, :find_product!
  layout 'business_with_sidebar'
  respond_to :html, :js

  def create
    @deal = @product.bargins.create(params[:deal])

    if @deal.persisted?
      flash[:notice] = t("deals.create.success")
    else
      flash[:error]  = t("deals.create.failure")
    end

    respond_with(@deal)
  end

  private
  def find_product!
    unless @product = @business.products.find_by_id(params[:product_id])
      redirect_to root_path
    end
  end
end
