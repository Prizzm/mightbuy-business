class LeadsController < ApplicationController
  before_filter :find_business
  before_filter :find_lead!, only: [:edit, :update, :destroy]
  layout 'business_with_sidebar'
  respond_to :html, :js, :csv

  def index
    all_leads = @business.customer_leads.order("created_at DESC").includes(:product)
    @leads = all_leads.page(params[:page]).per(10)

    respond_with(@leads) do |format|
      format.html
      format.js
      format.csv { send_data all_leads.to_csv }
    end
  end

  def edit
    respond_with(@lead)
  end

  def update
    if @lead.update_attributes(params[:customer_lead])
      lead_invite = @lead.create_topic_customer
      lead_invite.email_customer
      flash[:notice] = "Updated Lead Successfully"
    else
      flash[:error]  = @lead.errors.full_messages.first
    end

    respond_with(@lead)
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
