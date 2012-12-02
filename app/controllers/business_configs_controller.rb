class BusinessConfigsController < ApplicationController
  before_filter :find_business, :find_business_config!
  layout 'business_with_sidebar'

  def edit
  end

  def update
    if @business_config.update_attributes(params[:business_config])
      flash[:notice] = "Updated Lead Config Successfully"
      redirect_to edit_business_config_path
    else
      flash[:notice] = "Faild to Updated Lead Config"
      render action: :edit
    end
  end

  private
  def find_business_config!
    unless @business_config = @business.business_config
      redirect_to root_path
    end
  end
end
