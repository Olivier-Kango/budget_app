class AddCategoryToIncomes < ActiveRecord::Migration[7.0]
  def change
    add_reference :incomes, :category, null: true, foreign_key: true
  end
end
