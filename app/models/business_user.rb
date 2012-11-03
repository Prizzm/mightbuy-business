class BusinessUser
  include ActiveModelBehaviour

  attr_accessor :fullname, :business_name,:email, :business_url
  attr_accessor :password, :phone_number, :password_confirmation

  attr_accessor :errors

  attr_accessor :business, :business_staff

  def initialize(options = {})
    options.each do |key,value|
      if respond_to?("#{key}=")
        self.send("#{key}=",value)
      end
    end
    @errors = ActiveModel::Errors.new(self)
  end

  def save
    Business.transaction do
      @business = Business.create!(name: business_name, phone: phone_number, email: email)
      BusinessUrl.create!(domain: business_url, business: @business)
      @business_staff = BusinessStaff.create!(email: email, password: password, password_confirmation: password_confirmation, name: fullname, business: business)
      true
    end
  rescue StandardError => e
    errors.add(:base, e.message)
    false
  end

end

