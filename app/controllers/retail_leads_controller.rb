class RetailLeadsController < ApplicationController
  skip_before_filter :authenticate_business_login!
  before_filter :find_business
  before_filter :find_customer_lead!, only: [:show, :photo, :update]
  layout 'retail'

  def show
    render_wizard
  end

  def new
    @lead = @business.customer_leads.build
  end

  def photo
  end

  def create
    @lead = @business.customer_leads.create(params[:customer_lead])

    if @lead.persisted?
      redirect_to photo_retail_lead_path(@lead)
    else
      flash[:error] = @lead.errors.full_messages.first
      render action: :new
    end
  end

  def update
    if @lead.update_attributes(params[:customer_lead])
      if params[:commit] == "Send Now"
        lead_invite = @lead.create_topic_customer
        lead_invite.email_customer
      end

      flash[:notice] = "Updated Customer Lead Successfully"
      redirect_to new_retail_lead_path
    else
      flash[:notice] = @lead.errors.full_messages.first
      render action: :photo
    end
  end

  private
  def find_customer_lead!
    unless @lead = @business.customer_leads.find_by_id(params[:id])
      redirect_to new_retail_leads_path
    end
  end
end
