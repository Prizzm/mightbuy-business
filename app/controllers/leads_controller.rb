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
    @lead.topics.build
    respond_with(@lead)
  end

  def update
    @lead.assign_attributes(params[:customer_lead])

    if @lead.save!
      # lead_invite.email_customer(current_business_staff)

      flash[:notice] = "Updated Lead Successfully"
    else
      flash[:error]  = @lead.errors.full_messages.first
    end

    redirect_to edit_lead_path(@lead)
  end

  def destroy
    @lead.destroy
    redirect_to leads_path
  end

  protected
  def find_lead!
    unless @lead = @business.customer_leads.find_by_id(params[:id])
      redirect_to root_path
    end
  end
end
