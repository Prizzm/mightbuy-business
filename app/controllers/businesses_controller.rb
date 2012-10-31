class BusinessesController < ApplicationController
  skip_before_filter :authenticate_business_staff!, only: [:new, :create]

  layout 'business'

  def new

  end
end
