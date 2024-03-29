class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_business_staff!

  private
  def find_business
    unless @business = current_business_staff.business
      redirect_to root_path
    end
  end

  def after_sign_in_path_for(staff)
    if session.delete(:retail_login)
      session[:retail_session] = true
      new_retail_lead_path
    else
      super(staff)
    end
  end

  def after_sign_out_path_for(resource)
    if session.delete(:retail_session)
      session.delete(:retail_login)
      retail_path
    else
      super(resource)
    end
  end
end
