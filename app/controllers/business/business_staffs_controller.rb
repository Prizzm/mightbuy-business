class Business::BusinessStaffsController < ApplicationController
  layout 'business_with_sidebar'
  before_filter :find_business

  def index
    @business_staffs = @business.business_staffs.page(params[:page]).per(10)
    @business_staff = BusinessStaff.new()
  end

  def create
    business_staff_params = params[:business_staff]
    business_staff_params.update(password_confirmation: business_staff_params[:password], business: @business)
    business_staff = BusinessStaff.create(business_staff_params)
    if business_staff.errors.empty?
      flash[:notice] = "Successfully added"
    else
      flash[:error] = business_staff.errors.full_messages.first
    end
    redirect_to business_business_staffs_path
  end
end

