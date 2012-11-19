class LeadsMailer < ActionMailer::Base
  BCC_ADDRESS = "charles@mightbuy.it".freeze

  def invite_customer(lead_invite)
    @lead_invite = lead_invite
    from    = "#{@lead_invite.business_name} <no-reply@mightbuy.it>"
    subject = "[MB] Your image from #{@lead_invite.business_name}"
    #attachments.inline['storephoto'] = @lead_invite.lead.photo.jpg.url

    mail(to: @lead_invite.email,
      bcc: BCC_ADDRESS, from: from,
      subject: subject,reply_to: lead_invite.business_email)
  end
end
