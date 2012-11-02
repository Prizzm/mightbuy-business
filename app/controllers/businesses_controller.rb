class BusinessesController < ApplicationController
  skip_before_filter :authenticate_business_staff!, only: [:new, :create, :foo]

  before_filter :find_business, only: [:show, :complete_profile, :update]

  layout :choose_layout

  def new
    @business_user = BusinessUser.new()
  end

  def create
    @business_user = BusinessUser.new(params[:business_user])
    if @business_user.save
      sign_in @business_user.business_staff, bypass: true
      redirect_to root_path
    else
      flash[:error] = @business_user.errors.full_messages
      render :action => "new"
    end
  end

  def show
    unless @business.url_verified
      redirect_to complete_profile_business_path
    end
  end

  def update
    if @business.update_attributes(params[:business])
      flash[:notice] = "Updated business details successfully, we need to verify your business url before you can proceed."
    end
    render action: "complete_profile",layout: 'business'
  end

  def complete_profile
    render layout: 'business'
  end

  private

  def find_business
    @business = current_business_staff.business
  end

  def choose_layout
    if action_name == 'new'
      'application'
    else
      'business'
    end
  end
end
