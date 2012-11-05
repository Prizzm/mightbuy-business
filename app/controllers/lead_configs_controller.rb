class LeadConfigsController < ApplicationController
  before_filter :find_business
  before_filter :find_lead_config!, only: [:edit, :update]
  layout 'business_with_sidebar'

  def new
    @lead_config = @business.build_lead_config
  end

  def edit
  end

  def create
    @lead_config = @business.create_lead_config(params[:lead_config])

    if @lead_config.persisted?
      flash[:notice] = "Updated Lead Config Successfully"
      redirect_to edit_lead_config_path
    else
      flash[:notice] = "Faild to Updated Lead Config"
      render action: :new
    end
  end

  def update
    if @lead_config.update_attributes(params[:lead_config])
      flash[:notice] = "Updated Lead Config Successfully"
      redirect_to edit_lead_config_path
    else
      flash[:notice] = "Faild to Updated Lead Config"
      render action: :edit
    end
  end

  private
  def find_lead_config!
    unless @lead_config = @business.lead_config
      redirect_to root_path
    end
  end
end
