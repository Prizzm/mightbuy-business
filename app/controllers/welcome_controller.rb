class WelcomeController < ApplicationController
  skip_before_filter :authenticate_business_staff!
  layout 'anonymous', :except => [:index]

  def index
    if signed_in?
      redirect_to business_path
    else
      redirect_to new_business_staff_session_path
    end
  end
  def about
    
  end
  def contact
    
  end
  
  def terms
    
  end
  def pricing
    
  end  
  def help
    
  end  

end
