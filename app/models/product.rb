class Product < ApplicationRecord
  belongs_to :retailer

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: '0.00'.to_d }

  def display_price
    "$#{'%.2f' % price}"
  end
end
