class ShoppingCart < ApplicationRecord
  has_many :products, class_name: "ShoppingCarts::Product"
end
