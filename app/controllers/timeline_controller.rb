class TimelineController < ApplicationController
  before_filter :find_business
  layout 'business_with_sidebar'


  respond_to :html, :js

  def index
    timeline_events = @business.timeline_events

    @timeline = Kaminari.paginate_array(timeline_events).page(params[:page]).per(20)

    respond_with(@timeline) do |format|
      format.html
      format.js
    end
  end
end
