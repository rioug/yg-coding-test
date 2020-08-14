class CreateShoppingCartsProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_carts_products do |t|
      t.references :shopping_cart, index: true, null: false, foreign_key: true
      t.references :product, index: true, null: false, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
