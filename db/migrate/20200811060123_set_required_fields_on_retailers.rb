class SetRequiredFieldsOnRetailers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :retailers, :name, false
  end
end
