module RetailLeadsHelper
  def product_list_helper(business)
    @business.all_products.collect do |product|
      [ product.name, product.id ]
    end
  end
  
  def product_list_default(business)
      #change this to filter by a default value for products.. 
      @business.all_products.collect.first.id
  end
end
