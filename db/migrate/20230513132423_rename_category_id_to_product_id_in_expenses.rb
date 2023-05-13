class RenameCategoryIdToProductIdInExpenses < ActiveRecord::Migration[7.0]
  def change
    rename_column :expenses, :category_id, :product_id
  end
end
