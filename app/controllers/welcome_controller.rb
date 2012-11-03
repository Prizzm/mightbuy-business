class WelcomeController < ApplicationController
  skip_before_filter :authenticate_business_staff!
  def index
    if signed_in?
      redirect_to business_path
    else
      @business_staff = BusinessStaff.new()
    end
  end
end
