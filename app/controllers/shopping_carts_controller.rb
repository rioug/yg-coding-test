class ShoppingCartsController < ApplicationController

  # GET /shopping_cart/1
  # GET /shopping_cart/1.json
  def show
    @cart = ShoppingCart.find(params[:id])
  end
end
