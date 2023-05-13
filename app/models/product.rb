# frozen_string_literal: true

# Catefory
class Product < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :expenses
  validates :name, :icon, presence: true

  def product_total_amount
    expenses.sum(:amount)
  end

  def product_recent_expenses
    expenses.order(updated_at: :desc)
  end
end
