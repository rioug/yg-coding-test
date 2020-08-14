class ShoppingCarts::Product < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :product, class_name: '::Product'

  validates :quantity, presence: true, numericality: { greater_than: 0 }

  def display_price
    "$#{'%.2f' % price}"
  end

  def price
    product.price * quantity
  end
end
