namespace :product do
  desc "create domain for products"
  task :create_domain => :environment do
    Product.all.each do |product|
      product.update_domain_name
      product.save
    end
  end
end

