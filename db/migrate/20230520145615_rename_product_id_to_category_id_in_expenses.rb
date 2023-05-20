# frozen_string_literal: true

class RenameProductIdToCategoryIdInExpenses < ActiveRecord::Migration[7.0]
  def change
    rename_column :expenses, :product_id, :category_id unless column_exists?(:expenses, :category_id)
  end
end
