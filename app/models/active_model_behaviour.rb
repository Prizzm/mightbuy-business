module ActiveModelBehaviour
  extend ActiveSupport::Concern
  include ActiveModel::Validations
  include ActiveModel::Conversion
  included do
    extend ActiveModel::Naming
  end

  def persisted?; false; end
end
