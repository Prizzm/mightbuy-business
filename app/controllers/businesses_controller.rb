class BusinessesController < ApplicationController
  skip_before_filter :authenticate_business_staff!, only: [:new, :create, :foo]
  before_filter :find_business, only: [:show, :complete_profile, :update, :profile, :update_profile]
  respond_to :html, :js

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
    else
      render layout: 'business_with_sidebar'
    end
  end

  def update
    if @business.update_attributes(params[:business])
      @business.update_column('profile_updated',true)
      flash[:notice] = "Updated business details successfully, we need to verify your business url before you can proceed."
    end
    @business.reload

    respond_with(@business) do |format|
      format.html { render action: "complete_profile" }
    end
  end

  def update_profile
    if @business.update_attributes(params[:business])
      flash[:notice] = "Profile update"
    else
      flash[:error] = "Error updating profile"
    end
    redirect_to profile_business_path
  end

  def complete_profile
    if @business.business_urls.empty?
      @business.business_urls.build()
    end
  end

  def profile
    render layout: 'business_with_sidebar'
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
