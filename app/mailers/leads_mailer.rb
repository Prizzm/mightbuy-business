class LeadsMailer < ActionMailer::Base
  def invite_customer(lead)
    @lead = lead

    from    = "#{@lead.business.name.capitalize} <no-reply@mightbuy.it>"
    subject = "[MB] You are invited to join 'MightBuy'"
    mail to: @lead.email, from: from, subject: subject
  end
end
