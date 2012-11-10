class DealsController < ApplicationController
  before_filter :find_business, :find_product!
  before_filter :find_deal!, only: [:edit, :update]
  layout 'business_with_sidebar'
  respond_to :html, :js

  def edit
  end

  def create
    @deal = @product.create_bargin(params[:deal])

    if @deal.persisted?
      flash[:notice] = t("deals.create.success")
    else
      flash[:error]  = t("deals.create.failure")
    end

    respond_with(@deal)
  end

  def update
    if @deal.update_attributes(params[:bargin])
      flash[:notice] = t("deals.update.success")
    else
      flash[:error]  = t("deals.update.failure")
    end
    respond_with(@deal)
  end

  private
  def find_product!
    unless @product = @business.products.find_by_id(params[:product_id])
      redirect_to root_path
    end
  end

  def find_deal!
    unless @deal = @product.bargin
      redirect_to root_path
    end
  end
end
