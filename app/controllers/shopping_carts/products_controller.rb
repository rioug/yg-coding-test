class ShoppingCarts::ProductsController < ApplicationController
  before_action :set_shopping_cart, only: [:update, :destroy]
  before_action :set_shopping_carts_product, only: [:update, :destroy]

  # PATCH/PUT /shopping_carts/products/1
  # PATCH/PUT /shopping_carts/products/1.json
  def update
    if @shopping_carts_product.nil?
      # Shopping card product doesn't exist, add to the cart
      product_params = {
        shopping_cart_id: params[:shopping_cart_id],
        product_id: params[:id],
        quantity: 1
      }
      @shopping_carts_product = ShoppingCarts::Product.new(product_params)

      if @shopping_carts_product.save
        render_success
      else
        render_error
      end
    else
      # Shopping card product exists, increase quantity by one
      new_quantity = @shopping_carts_product.quantity + 1
      if @shopping_carts_product.update(quantity: new_quantity)
        render_success
      else
        render_error
      end
    end

  end

  ## DELETE /shopping_carts/products/1
  ## DELETE /shopping_carts/products/1.json
  #def destroy
  #end

  private
    def render_success
      respond_to do |format|
        format.html { redirect_to shopping_cart_url(params[:shopping_cart_id]), notice: 'Product was successfully added.' }
        format.json { redirect_to shopping_cart_url(params[:shopping_cart_id]).json }
      end
    end

    def render_error
      respond_to do |format|
        format.html { redirect_to shopping_cart_url(params[:shopping_cart_id]), alert: 'An error prevented product from being added'  }
        format.json { render json: @shopping_carts_product.errors, status: :unprocessable_entity }
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_cart
      @cart = ShoppingCart.find(params[:shopping_cart_id])
    end

    def set_shopping_carts_product
      @shopping_carts_product = ShoppingCarts::Product.find_by(shopping_cart_id: @cart.id, product_id: params[:id])
    end
end
