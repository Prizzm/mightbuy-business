class LeadsMailer < ActionMailer::Base
  helper RetailLeadsHelper

  BCC_ADDRESS = "charles@mightbuy.it".freeze

  def invite_customer(lead_invite)
    @lead_invite = lead_invite

    from    = "#{@lead_invite.business.name} <no-reply@mightbuy.it>"
    subject = "Your image from #{@lead_invite.business_name}"

    mail(
      to: @lead_invite.email,
      bcc: BCC_ADDRESS,
      from: from,
      subject: subject,
      reply_to: lead_invite.business_email
    )
  end
end
