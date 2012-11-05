module RetailLeadsHelper
  def product_list_helper(business)
    @business.products.collect do |product|
      [ product.name, product.id ]
    end
  end
end
