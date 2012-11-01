class BusinessesController < ApplicationController
  skip_before_filter :authenticate_business_staff!, only: [:new, :create, :foo]

  layout 'application'
  
  def new
  end
  
  def foo
    render layout: 'business'
  end
end
