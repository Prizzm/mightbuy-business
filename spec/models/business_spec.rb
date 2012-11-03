require "spec_helper"
describe Business do

  context "fetching products by url" do
    before do
      @business = FactoryGirl.create(:business)
      @url = FactoryGirl.create(:business_url, business: @business)

      @topic = FactoryGirl.create(:topic, url: "http://www.example.com/blahblah")
    end

    it "should return products by url" do
      products = @business.products_via_urls
      products.should_not be_empty
      products.should include(@topic.product)
    end

  end
end

