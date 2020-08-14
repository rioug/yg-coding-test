require 'rails_helper'

RSpec.describe "shopping_carts/show", type: :view do
  before(:each) do
    @cart = assign(:shopping_cart, ShoppingCart.create!(name: 'Cart'))
  end

  it "should render the cart name" do
    render
    expect(rendered).to match(/Cart/)
  end

  it "should show an empty cart message" do
    render
    expect(rendered).to match(/The cart is empty/)
  end
end
