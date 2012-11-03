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

  def edit
    @product = @business.all_products.detect {|product| product.id == params[:id].to_i }
    unless @product
      render nothing: true
    end
  end

  def update
    @product = @business.all_products.detect { |product| product.id == params[:id].to_i }
  end

  def destroy
    @product = @business.products.find_by_id(params[:id])
    if @product && @product.destroy
      flash[:notice] = "Product deleted"
    else
      flash[:error] = "You can not remove products linked with users"
    end
    redirect_to products_path
  end
end

