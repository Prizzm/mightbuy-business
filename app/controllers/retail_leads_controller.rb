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
    
    if params[:add] == "true"
      render(template: 'retail_leads/new_add_photo') and return;
    end
    
    if params[:list_add] == "1"
      render(template: 'retail_leads/new_add_list') and return;
    end
    
    if @business.business_config.include_liability?
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
      if @business.business_config.include_liability? && params[:added] != '1'
        redirect_to photo_retail_lead_path(@lead, :email => @lead.email, :phone_number => @lead_phone_number, :name => @lead.name ) 
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
      redirect_to new_retail_lead_path
    end
  end

  def send_lead_invite
    puts "sending invite"
    lead_invite = @lead.create_topic_customer
    if lead_invite.success?
      lead_invite.email_customer(current_business_staff)
    else
       puts "failed invited"+ lead_invite.message
      @lead.errors.add(:base,lead_invite.message)
    end
  end
end
