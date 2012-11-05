class RetailLeadsController < ApplicationController
  skip_before_filter :authenticate_business_login!
  before_filter :find_business
  layout 'business_with_sidebar'

  def index
  end
end
