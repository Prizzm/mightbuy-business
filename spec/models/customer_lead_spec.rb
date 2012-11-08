require "spec_helper"

describe CustomerLead do
  let(:customer_lead) { FactoryGirl.create(:customer_lead) }

  context "creating topic and customer from a lead" do
    it "should create topic & customer given a lead" do
      lead_invite = customer_lead.create_topic_customer
      lead_invite.success?.should be_true

      lead_invite.topic.should_not be_nil
      lead_invite.user.should_not be_nil

      lead_invite.lead_url.should_not be_nil
    end
  end

  context "should be able to trigger customer invite based on lead" do
    before do
      @lead_invite = customer_lead.create_topic_customer
    end

    it "should be able to trigger the email" do
      mailer = @lead_invite.email_customer
      mailer.should deliver_to(customer_lead.email)
    end
  end
end

