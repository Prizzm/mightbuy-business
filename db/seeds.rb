# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.where(name: 'IApple').destroy_all
User.where("name like '% kumar'").destroy_all
Topic.where(subject: "iApple Stuff").destroy_all

20.times do |i|
  User.transaction do
    product_url = "http://www.apple.com/idevise#{i}"
    product = Product.create!(url: product_url, name: "iApple")
    user = User.create!(email: "hemantx-#{i}@example.com",name: "#{i} kumar",password: "password")
    Topic.create!(subject: "iApple Stuff", url: product_url, user: user,shortcode: "abcd#{i}", access: 'public')
  end
end

