require 'rails_helper'

RSpec.describe ShoppingCart, type: :model do
  let(:valid_attributes) {
    {
      name: 'cart',
    }
  }

  subject { ShoppingCart.create(valid_attributes) }

  describe '#name' do
    it 'is optional' do
      subject.name = ''
      expect(subject).to be_valid
    end
  end

  describe '#total_price' do
    it 'should calculate cart total price' do
      product1 = Product.create!(
        name: "Product 1",
        price: "1.23",
        retailer: Retailer.create!(name: 'Shop 1')
      )
      product2 = Product.create!(
        name: "Product 2",
        price: "3",
        retailer: Retailer.create!(name: 'Shop 2')
      )

      ShoppingCarts::Product.create(shopping_cart_id: subject.id, product_id: product1.id, quantity: 1)
      ShoppingCarts::Product.create(shopping_cart_id: subject.id, product_id: product2.id, quantity: 3)

      expect(subject.total_price).to eq('$10.23')
    end
  end
end
