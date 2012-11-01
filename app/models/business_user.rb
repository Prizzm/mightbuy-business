class BusinessUser
  include ActiveModelBehaviour

  attr_accessor :fullname, :business_name,:email, :business_url
  attr_accessor :password, :phone_number, :password_confirmation

  def initialize(options = {})
    options.each do |key,value|
      if respond_to?("#{key}=")
        self.send("#{key}=",value)
      end
    end
  end

  def save

  end
end
