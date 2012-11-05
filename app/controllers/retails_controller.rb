class RetailsController < ApplicationController
  skip_before_filter :authenticate_business_staff!, :authenticate_business_login!
  before_filter :set_retail_information_in_session, only: :show

  def show
    @business_staff = BusinessStaff.new()
  end

  private
  def set_retail_information_in_session
    session[:retail_login] = true
  end
end
