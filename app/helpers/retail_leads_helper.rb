module RetailLeadsHelper
  def product_list_helper(business)
    @business.products.collect do |product|
      [ product.name, product.id ]
    end
  end


  def replace_variables_helper(signature, lead_invite)
    return unless signature.is_a? String

    if lead_invite.lead.product
      signature.gsub!(/{{\s*product\.name\s*}}/, lead_invite.lead.product.name)
    end

    signature
  end
end
