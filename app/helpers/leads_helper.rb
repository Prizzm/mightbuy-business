module LeadsHelper
  def lead_photo_url_helper(lead)
    lead.photo ? lead.photo.thumb('100x100!').url : "/assets/no-image.gif"
  end
end
