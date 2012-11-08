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

  delegate :name, :email, :to => :lead

  def lead_url
    "#{MB.config.invite_url}?token=#{user.invite_token}"
  end
end
