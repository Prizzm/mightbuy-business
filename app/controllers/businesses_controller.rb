class BusinessesController < ApplicationController
  skip_before_filter :authenticate_business_staff!, only: [:new, :create, :foo]

  before_filter :find_business, only: [:show, :complete_profile]

  layout 'application'

  def new
    @business_user = BusinessUser.new()
  end

  def create
    @business_user = BusinessUser.new(params[:business_user])
    if @business_user.save
      redirect_to root_path
    else
      flash[:error] = @business_user.errors.full_messages
      render :action => "new"
    end
  end

  def show
    unless @business.url_verified
      redirect_to complete_profile_businesses_path
    end
  end

  def complete_profile
    render layout: 'business'
  end

  private

  def find_business
    @business = current_business_staff.business
  end
end
