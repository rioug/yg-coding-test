class Product < ApplicationRecord
  belongs_to :retailer

  def display_price
    "$#{'%.2f' % price}"
  end
end
