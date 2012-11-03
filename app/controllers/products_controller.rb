class ProductsController < ApplicationController
  before_filter :find_business
  layout 'business_with_sidebar'

  def index
    @products = Kaminari.paginate_array(@business.all_products.to_a).page(params[:page]).per(10)
    @product = Product.new()
  end

  def create
    @product = Product.new(params[:product])
    @product.business = @business
    if @product.save
      flash[:notice] = "Product saved"
    else
      flash[:error] = @product.errors.full_messages.join(" ")
    end
    redirect_to products_path
  end
end
