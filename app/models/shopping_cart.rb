class ShoppingCart < ApplicationRecord
  has_many :products, class_name: "ShoppingCarts::Product"

  def total_price
    total = products.sum(&:price)

    "$#{'%.2f' % total}"
  end
end
