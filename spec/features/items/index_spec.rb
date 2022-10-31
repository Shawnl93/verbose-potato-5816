require "rails_helper"

RSpec.describe "item's index page" do
  describe "When I visit the Item's index page" do
    before :each do
      @supermarket_1 = Supermarket.create!(name: "Shawn's Market", location: "123 Food St")
      @supermarket_2 = Supermarket.create!(name: "Lee's Market", location: "456 Food St")
      @customer = Customer.create!(name:"Shawn")
      @customer_1 = Customer.create!(name:"Lee")
      @item_1 = @supermarket_1.items.create!(name:"Banana", price: 1)
      @item_2 = @supermarket_2.items.create!(name:"Apple", price: 2)
      @item_3 = @supermarket_1.items.create!(name:"Peach", price: 3)
      @customer_item_1 = CustomerItem.create!(customer: @customer, item: @item_1)
      @customer_item_4 = CustomerItem.create!(customer: @customer, item: @item_1)
      @customer_item_5 = CustomerItem.create!(customer: @customer, item: @item_1)
      @customer_item_3 = CustomerItem.create!(customer: @customer_1, item: @item_3)
      @customer_item_2 = CustomerItem.create!(customer: @customer, item: @item_2)
      visit "/items"
    end

    it "A list of all items and attributes" do
      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.price)
      expect(page).to have_content(@item_2.name)
      expect(page).to have_content(@item_2.price)
      expect(page).to have_content(@item_3.name)
      expect(page).to have_content(@item_3.price)
      expect(page).to have_content(@supermarket_1.name)
      expect(page).to have_content(@supermarket_2.name)
    end

    it "count the customer that bought that item" do
      expect(page).to have_content("Number of Customers: 3")
      expect(page).to have_content("Number of Customers: 1")
    end
  end
end
