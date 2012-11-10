class LeadInvite
  attr_accessor :topic, :user, :message, :success_flag

  attr_accessor :lead

  def initialize(lead)
    @lead = lead
    @success_flag = true
  end

  def add(options = {})
    options.each { |k,v|
      if self.respond_to?("#{k}=")
        self.send("#{k}=",v)
      end
    }
    self
  end

  def add_error(incoming_message)
    self.message = incoming_message
    self.success_flag = false
    self
  end

  def email_customer
    lead.send_invite!
    LeadsMailer.invite_customer(self).deliver
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

  delegate :name, :email, :message, :to => :lead

  def lead_url
    if lead.invite_token
      "#{MB.config.invite_url}?token=#{lead.invite_token}&topic_id=#{topic.to_param}"
    else
      "#{MB.config.app_url}/topics/#{topic.to_param}"
    end
  end
end
