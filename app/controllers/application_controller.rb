class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_business_staff!

  private
  def find_business
    @business = current_business_staff.business
  end
end
