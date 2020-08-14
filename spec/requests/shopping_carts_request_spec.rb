require 'rails_helper'

RSpec.describe "/shopping_carts", type: :request do
  let!(:cart) { ShoppingCart.create! }

  describe "GET /show" do
    it "renders a successful response" do
      get shopping_cart_url(cart)
      expect(response).to be_successful
    end
  end
end
