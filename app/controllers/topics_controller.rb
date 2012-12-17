class TopicsController < ApplicationController
  before_filter :find_business, :find_lead!, :find_topic!

  respond_to :js
  def destroy
    @topic.destroy

    respond_with(@topic) do |format|
      format.js
    end
  end


  protected
    def find_lead!
      unless @lead = @business.customer_leads.find_by_id(params[:lead_id])
        redirect_to root_path
      end
    end

    def find_topic!
      unless @topic = @lead.topics.find_by_shortcode(params[:id])
        redirect_to root_path
      end
    end
end
2