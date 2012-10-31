class BusinessesController < ApplicationController
  skip_before_filter :authenticate_business_staff!, only: [:new, :create]

  def new

  end
end
