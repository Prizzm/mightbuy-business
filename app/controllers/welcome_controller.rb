class WelcomeController < ApplicationController
  skip_before_filter :authenticate_business_staff!
  def index
    if signed_in?
      redirect_to business_path
    end
  end
end
