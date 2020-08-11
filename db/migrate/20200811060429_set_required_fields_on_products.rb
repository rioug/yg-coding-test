class SetRequiredFieldsOnProducts < ActiveRecord::Migration[5.2]
  def change
    change_column_null :products, :name, false
    change_column_null :products, :price, false
    change_column_null :products, :retailer_id, false
  end
end
