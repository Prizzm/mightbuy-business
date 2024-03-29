class ProductsController < ApplicationController
  before_filter :find_business
  layout 'business_with_sidebar'

  def index
    products = Product.find(:all, conditions: {
      business_id: @business.id
    }, order: sort_column + ' ' + sort_direction)

    @products = Kaminari.paginate_array(products).page(params[:page]).per(10)
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
    @product = @business.find_and_update_product(params[:id])
    unless @product
      render nothing: true
    end
  end

  def update
    @product = @business.find_and_update_product(params[:id])
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


  protected
    def sort_direction
      if %w[asc desc].include?(params[:direction])
        params[:direction]
      else
        'asc'
      end
    end

    def sort_column
      if Product.column_names.include?(params[:direction])
        params[:direction]
      else
        'name'
      end
    end
end