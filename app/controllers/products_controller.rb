class ProductsController < ApplicationController
  before_filter :find_business
  layout 'business_with_sidebar'

  def index
    @products = Kaminari.paginate_array(@business.all_products.to_a).page(params[:page]).per(10)
  end
end
