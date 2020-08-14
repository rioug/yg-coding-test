require 'rails_helper'

RSpec.describe ShoppingCarts::Product, type: :model do
  let(:cart) { ShoppingCart.create!(name: 'cart') }
  let(:retailer) { Retailer.create!(name: 'shop') }
  let(:product) { Product.create!(name: 'product', price: 1.99, retailer: retailer) }

  let(:valid_attributes) {
    {
      shopping_cart_id: cart.id,
      product_id: product.id,
      quantity: 2,
    }
  }

  subject { ShoppingCarts::Product.create(valid_attributes) }

  describe '#quantity' do
    it 'is required' do
      subject.quantity = ''
      expect(subject).not_to be_valid
    end

    it 'must be greater than zero' do
      subject.quantity = '-2'
      expect(subject).not_to be_valid
    end
  end
end
