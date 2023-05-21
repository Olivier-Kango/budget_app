class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.decimal :income

      t.timestamps
    end
  end
end
