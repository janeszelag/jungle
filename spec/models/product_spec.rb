require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before(:each) do
      @category = Category.new(id: 1, name: "Cars")
      @product = Product.new(name: "Honda", price: 30000, quantity: 5, category: @category)
    end
    
    it "is valid with valid attributes" do
      expect(@product).to be_valid
      expect(@category).to be_valid
    end
    it "is not valid without a name" do
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @product.category = nil
      expect(@product).to_not be_valid
    end
  end
end

