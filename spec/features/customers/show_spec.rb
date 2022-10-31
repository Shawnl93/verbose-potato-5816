require 'rails_helper'

RSpec.describe "customers show page" do
  describe "When I visit the customer's show page" do
    before :each do
      @supermarket_1 = Supermarket.create!(name: "Shawn's Market", location: "123 Food St")
      @supermarket_2 = Supermarket.create!(name: "Lee's Market", location: "456 Food St")
      @customer = Customer.create!(name:"Shawn")
      @customer_1 = Customer.create!(name:"Lee")
      @item_1 = @supermarket_1.items.create!(name:"Banana", price: 1)
      @item_2 = @supermarket_2.items.create!(name:"Apple", price: 2)
      @item_3 = @supermarket_1.items.create!(name:"Peach", price: 3)
      @customer_item = CustomerItem.create!(customer: @customer, item: @item_1)
      @customer_item = CustomerItem.create!(customer: @customer, item: @item_2)
      @customer_item = CustomerItem.create!(customer: @customer_1, item: @item_3)
      visit "/customers/#{@customer.id}"
    end

    it "see customer's name and a list of it's items" do
      expect(page).to have_content(@customer.name)
      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_2.name)
      expect(page).to_not have_content(@item_3.name)
    end

    it "shows item's name price and the supermarket it belongs to" do
      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.price)
      expect(page).to have_content(@item_2.name)
      expect(page).to have_content(@item_2.price)
      expect(page).to have_content(@supermarket_1.name)
      expect(page).to have_content(@supermarket_2.name)
      expect(page).to_not have_content(@item_3.name)
    end
  end
end
