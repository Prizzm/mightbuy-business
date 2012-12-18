class LeadInvite
  attr_accessor :lead, :business_staff, :message, :success_flag

  delegate :name, :email, :message, :to => :lead
  delegate :email, :phone, to: :business, prefix: true


  def initialize(lead)
    @lead = lead
    @success_flag = false
  end


  def email_customer
    lead.send_invite!
    @success_flag = LeadsMailer.invite_customer(self).deliver
  end


  def success?
    success_flag
  end

  def error?
    !success_flag
  end


  def business_name
    lead.business.name.capitalize
  end

  def business
    lead.business
  end

  def title_topic
    topic.subject
  end

  def lead_url
    if lead.invite_token
      if lead.topics.length > 1
        "#{MB.config.invite_url}?token=#{lead.invite_token}"
      else
        "#{MB.config.invite_url}?token=#{lead.invite_token}&topic_id=#{lead.topics.first.to_param}"
      end
    else
      if lead.topics.length > 1
        "#{MB.config.app_url}/me"
      else
        "#{MB.config.app_url}/topics/#{lead.topics.first.to_param}"
      end
    end
  end

  def topic_url(topic)
    "#{MB.config.app_url}/topics/#{topic.to_param}"
  end
end
