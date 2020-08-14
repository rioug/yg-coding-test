require "rails_helper"

RSpec.describe ShoppingCarts::ProductsController, type: :routing do
  describe "routing" do
    it "routes to #update via PUT" do
      expect(put: "/shopping_carts/2/products/1").to route_to("shopping_carts/products#update", id: "1", shopping_cart_id: "2")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/shopping_carts/2/products/1").to route_to("shopping_carts/products#update", id: "1", shopping_cart_id: "2")
    end

    it "routes to #destroy" do
      expect(delete: "/shopping_carts/2/products/1").to route_to("shopping_carts/products#destroy", id: "1", shopping_cart_id: "2")
    end
  end
end
