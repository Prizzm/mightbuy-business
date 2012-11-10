require "spec_helper"

describe CustomerLead do
  let(:customer_lead) { FactoryGirl.create(:customer_lead) }

  describe "Customer lead states" do
    it "should start iwth nonsent state" do
      customer_lead.notsent?.should be_true
    end

    it "can transition to sent state" do
      customer_lead.send_invite!

      customer_lead.sent?.should be_true
    end

    it "can transition to accepted state" do
      customer_lead.send_invite!
      customer_lead.accept!
      customer_lead.accepted?.should be_true
    end
  end

  context "creating topic and customer from a lead" do
    it "should create topic & customer given a lead" do
      lead_invite = customer_lead.create_topic_customer
      lead_invite.success?.should be_true

      lead_invite.topic.should_not be_nil
      lead_invite.user.should_not be_nil

      lead_invite.lead_url.should_not be_nil
      customer_lead.user.should_not be_nil
      customer_lead.invite_token.should_not be_nil
    end
  end

  context "should be able to trigger customer invite based on lead" do
    before do
      @lead_invite = customer_lead.create_topic_customer
    end

    it "should be able to trigger the email" do
      mailer = @lead_invite.email_customer
      customer_lead.sent?.should be_true
      mailer.should deliver_to(customer_lead.email)
      mailer.should have_body_text(@lead_invite.message)
    end
  end


  context "If user already exists in the system" do
    before do
      @user = FactoryGirl.create(:user, email: "hemant+test@example.com")
    end
    it "should not redirect user to invite url" do
      customer_lead = FactoryGirl.create(:customer_lead, email: "hemant+test@example.com")
      lead_invite = customer_lead.create_topic_customer
      lead_invite.lead_url.should match(/topics\//)
    end
  end

  describe ".to_csv" do
    let(:business) { FactoryGirl.create(:business) }
    let(:csv_content)  { CustomerLead.to_csv }
    let(:csv_headers)  { ["Id", "Registered On", "Name", "Email", "Product", "Status"].join(",") }
    let(:csv_data)     { csv_content.gsub(csv_headers, "") }

    context "when no entries" do
      it "has specific headers" do
        csv_content.strip.should == csv_headers
      end

      it "has no data" do
        csv_data.strip.should be_blank
      end
    end

    context "with entries" do
      let(:ipad)  { FactoryGirl.create(:customer_lead, name: "Steve Jobs", phone_number:"1234567890") }
      let(:ipod)  { FactoryGirl.create(:customer_lead, name: "Tim Cook",   phone_number:"9876543210") }
      before(:each) { [ipad, ipod] }

      it "has specific headers" do
        csv_content.strip.should match(csv_headers)
      end

      it "has leads data" do
        [ipad, ipod].each do |lead|
          csv_data.should match(lead.id.to_s)
          csv_data.should match(lead.name)
          csv_data.should match(lead.email)
          csv_data.should match(lead.product.name)
          csv_data.should match(lead.humanized_status)
        end
      end
    end
  end
end
