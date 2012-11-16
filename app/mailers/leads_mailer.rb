class LeadsMailer < ActionMailer::Base
  BCC_ADDRESS = "charles@mightbuy.it".freeze

  def invite_customer(lead_invite)
    @lead_invite = lead_invite

    from    = "#{@lead_invite.business_name} <no-reply@mightbuy.it>"
    subject = "[MB] You are invited to join 'MightBuy'"
    mail to: @lead_invite.email, bcc: BCC_ADDRESS, from: from, subject: subject
  end
end
