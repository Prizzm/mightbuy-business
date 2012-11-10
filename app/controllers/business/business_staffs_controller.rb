class Business::BusinessStaffsController < ApplicationController
  layout 'business_with_sidebar'
  before_filter :find_business

  def index
    @business_staffs = @business.business_staffs
  end
end
