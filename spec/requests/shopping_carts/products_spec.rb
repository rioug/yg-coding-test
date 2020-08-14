 require 'rails_helper'

RSpec.describe "/shopping_carts/products", type: :request do
  let(:retailer) { Retailer.create!(name: 'shop') }
  let(:product) { Product.create!(name: 'product', price: 1.99, retailer: retailer) }

  describe "PATCH /update" do
    before(:each) do
     @cart = ShoppingCart.create!(name: 'cart')
    end

    context "product is not in the cart" do
      it "creates a new ShoppingCarts::Product" do
        expect {
          patch shopping_cart_product_url(@cart.id, product)
        }.to change(ShoppingCarts::Product, :count).by(1)
      end

      it "redirects to the ShoppingCart" do
        patch shopping_cart_product_url(@cart.id, product)
        expect(response).to redirect_to(shopping_cart_url(@cart.id))
      end
    end

    context "product is in the cart already" do
      before(:each) do
        @shopping_cart_product = ShoppingCarts::Product.create!(
          shopping_cart_id: @cart.id, product_id: product.id, quantity: 1
        )
      end

      it "increase quantity by one" do
        patch shopping_cart_product_url(@cart.id, product)
        @shopping_cart_product.reload
        expect(@shopping_cart_product.quantity).to eq(2)
      end

      it "redirects to the ShoppingCart" do
        patch shopping_cart_product_url(@cart.id, product)
        expect(response).to redirect_to(shopping_cart_url(@cart.id))
      end
    end
  end

  #describe "DELETE /destroy" do
  #end
end
