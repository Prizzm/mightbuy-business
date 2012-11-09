module RetailLeadsHelper
  def product_list_helper(business)
    @business.all_products.collect do |product|
      [ product.name, product.id ]
    end
  end
end
