class LeadConfigsController < ApplicationController
  before_filter :find_business, :find_lead_config!
  layout 'business_with_sidebar'

  def edit
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
