require 'rails_helper'

RSpec.describe "shopping_carts/show", type: :view do
  before(:each) do
    @cart = assign(:shopping_cart, ShoppingCart.create!(name: 'Cart'))
  end

  it "should render the cart name" do
    render
    expect(rendered).to match(/Cart/)
  end

  it "should show an empty cart message if cart is empty" do
    render
    expect(rendered).to match(/The cart is empty/)
  end

  context "cart not empty" do
    before(:each) do
      product1 = Product.create!(
        name: "Product 1",
        price: "2.5",
        retailer: Retailer.create!(name: 'Shop 1')
      )
      product2 = Product.create!(
        name: "Product 2",
        price: "3",
        retailer: Retailer.create!(name: 'Shop 2')
      )
      ShoppingCarts::Product.create!(shopping_cart_id: @cart.id, product_id: product1.id, quantity: 2)
      ShoppingCarts::Product.create!(shopping_cart_id: @cart.id, product_id: product2.id, quantity: 1)
    end

    it "should show a list of products" do
      render
      assert_select "tr>td", text: "Product 1".to_s
      assert_select "tr>td", text: "2".to_s
      assert_select "tr>td", text: "Product 2".to_s
      assert_select "tr>td", text: "1".to_s
    end

    it "should show total price" do
      render
      assert_select "tr>td", text: "Total:".to_s
      assert_select "tr>td", text: @cart.total_price.to_s
    end
  end
end
