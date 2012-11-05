class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_business_staff!, :authenticate_business_login!

  private
  def find_business
    @business = current_business_staff.business
  end

  def authenticate_business_login!
    if session.has_key?(:retail_session)
      sign_out

      session.delete(:retail_login)
      session.delete(:retail_session)
      redirect_to(new_business_staff_session_path)
    end
  end

  def after_sign_in_path_for(staff)
    if session.delete(:retail_login)
      session[:retail_session] = true
      retail_leads_path
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
