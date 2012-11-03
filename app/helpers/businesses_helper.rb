module BusinessesHelper
  def verification_alert_class
    if @business.profile_updated
      "verify-alert"
    else
      "verify-alert hide"
    end
  end

  def save_profile_button_class
    if @business.profile_updated
      "btn btn-red w230 m-auto disabled"
    else
      "btn btn-red w230 m-auto"
    end
  end

  def business_form_logo_url_helper(business)
    if business.logo
      business.logo.thumb('160x80').url
    else
      "/assets/company-logo.gif"
    end
  end
end
