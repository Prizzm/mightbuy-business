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
      flash[:error] = @business_user.errors.full_messages.join(" ")
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
      @business.update_column('profile_updated',true)
      flash[:notice] = "Updated business details successfully, we need to verify your business url before you can proceed."
    end
    @business.reload
    render action: "complete_profile"
  end

  def complete_profile
    if @business.business_urls.empty?
      @business.business_urls.build()
    end
  end

  private
  def choose_layout
    if ['new','create'].include?(action_name)
      'application'
    else
      'business'
    end
  end
end
