# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@supermarket_1 = Supermarket.create!(name: "Shawn's Market", location: "123 Food St")
@supermarket_2 = Supermarket.create!(name: "Lee's Market", location: "456 Food St")
@customer = Customer.create!(name:"Shawn")
@customer_1 = Customer.create!(name:"Lee")
@item_1 = @supermarket_1.items.create!(name:"Banana", price: 1)
@item_2 = @supermarket_2.items.create!(name:"Apple", price: 2)
@item_3 = @supermarket_1.items.create!(name:"Peach", price: 3)
@customer_item_1 = CustomerItem.create!(customer: @customer, item: @item_1)
@customer_item_3 = CustomerItem.create!(customer: @customer_1, item: @item_3)
@customer_item_2 = CustomerItem.create!(customer: @customer, item: @item_2)
