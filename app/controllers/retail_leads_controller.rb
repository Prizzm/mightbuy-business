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

    if @business.lead_config.include_liability?
      render template: 'retail_leads/new'
    else
      render template: 'retail_leads/new_with_photo'
    end
  end

  def photo
  end

  def create
    @lead = @business.customer_leads.create(params[:customer_lead])

    if @lead.persisted?
      if @business.lead_config.include_liability?
        redirect_to photo_retail_lead_path(@lead)
      else
        send_lead_invite if params[:send_email] == '1'
      end
    else
      flash[:error] = @lead.errors.full_messages.first
      render action: :new
    end
  end

  def update
    @lead.update_attributes(params[:customer_lead])

    if @lead.errors.empty? && params[:send_email] == '1'
      send_lead_invite
    end

    if @lead.errors.empty?
      flash[:notice] = "Updated Customer Lead Successfully"
    else
      flash[:notice] = @lead.errors.full_messages.first
    end
  end

  private
  def find_customer_lead!
    unless @lead = @business.customer_leads.find_by_id(params[:id])
      redirect_to new_retail_leads_path
    end
  end

  def send_lead_invite
    lead_invite = @lead.create_topic_customer
    if lead_invite.success?
      lead_invite.email_customer(current_business_staff)
    else
      @lead.errors.add(:base,lead_invite.message)
    end
  end
end
