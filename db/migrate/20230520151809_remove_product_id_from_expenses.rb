class RemoveProductIdFromExpenses < ActiveRecord::Migration[7.0]
  def change
    remove_column :expenses, :product_id if column_exists?(:expenses, :product_id)
  end
end
