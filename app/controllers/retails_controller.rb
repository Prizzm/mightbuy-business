class RetailsController < ApplicationController
  skip_before_filter :authenticate_business_staff!, :authenticate_business_login!
  before_filter :set_retail_information_in_session, only: :show

  def show
    if signed_in?
      redirect_to new_retail_lead_path
    else
      @business_staff = BusinessStaff.new()
    end
  end

  private
  def set_retail_information_in_session
    session[:retail_login] = true unless signed_in?
  end
end
