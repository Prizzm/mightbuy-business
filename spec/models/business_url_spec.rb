require "spec_helper"

describe BusinessUrl do
  it "should return fqdn" do
    business_url = FactoryGirl.create(:business_url, domain: "http://www.google.com")
    business_url.fqdn.should == "www.google.com"
  end
end
