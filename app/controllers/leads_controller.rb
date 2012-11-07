class LeadsController < ApplicationController
  before_filter :find_business
  before_filter :find_lead!, only: :destroy
  layout 'business_with_sidebar'

  def index
    @leads = @business.customer_leads.order("created_at DESC").
      page(params[:page]).per(10)
  end

  def destroy
    @lead.destroy
    redirect_to leads_path
  end

  private
  def find_lead!
    unless @lead = @business.customer_leads.find_by_id(params[:id])
      redirect_to root_path
    end
  end
end
