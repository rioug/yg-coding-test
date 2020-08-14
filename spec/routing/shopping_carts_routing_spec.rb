require "rails_helper"

RSpec.describe ShoppingCartsController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/shopping_carts/1").to route_to("shopping_carts#show", id: "1")
    end
  end
end

