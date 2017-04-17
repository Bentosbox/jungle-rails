require 'rails_helper'

RSpec.describe Product, type: :model do
describe 'Validations' do

  before(:each) do
    @cat = Category.new
  end

  context "validations" do
    it "should create a product" do
      @product = @cat.products.new(
        name: "test",
        price: 10,
        quantity: 10
        )
      expect(@product).to be_valid
    end

    it "should not pass with no name" do
      @product = @cat.products.new(
        price: 10,
        quantity: 10
        )
      expect(@product).to_not be_valid
    end

    it "should not pass with no price" do
      @product = @cat.products.new(
        name: "charger",
        quantity: 10
        )
      expect(@product).to_not be_valid
    end


    it "should not pass with no quantity" do
      @product = @cat.products.new(
        name: "test",
        price: 120
        )
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
  end
end



end
