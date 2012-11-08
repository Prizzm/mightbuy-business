class LeadsMailer < ActionMailer::Base
  def invite_customer(lead_invite)
    @lead_invite = lead_invite

    from    = "#{@lead_invite.business_name} <no-reply@mightbuy.it>"
    subject = "[MB] You are invited to join 'MightBuy'"
    mail to: @lead_invite.email, from: from, subject: subject
  end
end
