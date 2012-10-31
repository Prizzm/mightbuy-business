class WelcomeController < ApplicationController
  skip_before_filter :authenticate_business_staff!
  def index
  end
end
