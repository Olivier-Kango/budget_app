class RenameCategoriesToProductsAndAddColumns < ActiveRecord::Migration[7.0]
  def change
    rename_table :categories, :products

    add_column :products, :price, :decimal
    add_column :products, :stock_quantity, :integer
  end
end
