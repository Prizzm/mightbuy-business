class LeadsMailer < ActionMailer::Base
  BCC_ADDRESS = "charles@mightbuy.it".freeze

  def invite_customer(lead_invite, business_staff)
    @lead_invite = lead_invite
    @business_staff = business_staff

    from    = "#{@lead_invite.business_name} <no-reply@mightbuy.it>"
    subject = "Your image from #{@lead_invite.business_name}"
    #attachments.inline['storephoto'] = @lead_invite.lead.photo.jpg.url

    mail(to: @lead_invite.email,
      bcc: BCC_ADDRESS, from: from,
      subject: subject,reply_to: lead_invite.business_email)
  end
end
