module LeadsHelper
  def lead_photo_url_helper(lead)
    if lead.photo
      lead.photo.thumb('100x100!').url
    else
      "/assets/no-image.gif"
    end
  end


  def lead_topic_image_url_helper(topic)
    if topic.image
      topic.image.thumb('100x100!').url
    else
      "/assets/no-image.gif"
    end
  end
end
