class ChangeProductIdToCategoryIdInExpenses < ActiveRecord::Migration[7.0]
  def change
    rename_column :expenses, :product_id, :category_id
  end
end
