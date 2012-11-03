class LeadsController < ApplicationController
  before_filter :find_business
  layout 'business_with_sidebar'

  def index

  end
end
