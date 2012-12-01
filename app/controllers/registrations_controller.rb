class RegistrationsController < Devise::RegistrationsController
  before_filter :find_business

  layout 'business_with_sidebar'
end