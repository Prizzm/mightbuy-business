require "spec_helper"

describe Product do
  describe "should automatically set domain name" do
    product = FactoryGirl.create(:product, url: "http://www.google.com/dsds?q=hello")
    product.domain_name.should == "www.google.com"
  end
end
