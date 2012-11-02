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
end
