class CustomersController < ApplicationController
  layout 'business_with_sidebar'
  before_filter :find_business

  def index
    @customers = Kaminari.paginate_array(@business.customers.to_a).page(params[:page]).per(10)
  end
end
