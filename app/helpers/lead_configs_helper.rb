module LeadConfigsHelper
  def lead_config_method_helper(lead_config)
    lead_config.persisted? ? :put : :post
  end
end
