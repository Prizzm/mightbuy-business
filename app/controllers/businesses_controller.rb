class BusinessesController < ApplicationController
  skip_before_filter :authenticate_business_staff!, only: [:new, :create, :foo]

  layout 'application'

  def new
    @business_user = BusinessUser.new()
  end

  def create
    @business_user = BusinessUser.new(params[:business_user])
    if @business_user.save
      redirect_to business_path(@business_user.business)
    else
      flash[:error] = @business_user.errors.full_messages
      render :action => "new"
    end
  end

  def foo
    render layout: 'business'
  end
end
