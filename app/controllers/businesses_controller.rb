class BusinessesController < ApplicationController
  skip_before_filter :authenticate_business_staff!, only: [:new, :create, :foo]

  layout 'application'

  def new
    @business_user = BusinessUser.new()
  end

  def create
    @business_user = BusinessUser.new(params[:business])
    if @business_user.save

    end
  end

  def foo
    render layout: 'business'
  end
end
