# frozen_string_literal: true

class AddCategoryIdToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :category_id, :bigint unless column_exists?(:expenses, :category_id)
  end
end