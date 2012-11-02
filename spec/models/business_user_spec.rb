require "spec_helper"

describe BusinessUser do
  describe "with valid parameters" do
    before do
      @business_params = {
        fullname: "Hemant Kumar", business_name: "Prizzm Inc",
        email: "hemant@example.com", business_url: "http://mightbuy.it",
        password: "password", password_confirmation: "password",
        phone_number: "+919740313399"
      }
    end

    it "should allow creating an user" do
      business_user = BusinessUser.new(@business_params)
      business_user.save.should be_true

      business_staff = BusinessStaff.find_by_email("hemant@example.com")
      business_staff.should_not be_nil

      business = Business.find_by_url("http://mightbuy.it")
      business.should_not be_nil
    end
  end

  describe "with invalid parameters" do
    before do
      @business_params = {
        fullname: "Hemant Kumar", business_name: "Prizzm Inc",
        email: "hemant@example.com", business_url: "http://mightbuy.it",
        password: "password", password_confirmation: "password",
        phone_number: "+919740313399"
      }
    end

    it "should throw error" do
      business_user = BusinessUser.new(@business_params)
      business_user.save

      another_user = BusinessUser.new(@business_params)
      another_user.save.should be_false
      another_user.errors[:base].should include("Validation failed: Email has already been taken")
    end
  end

end
