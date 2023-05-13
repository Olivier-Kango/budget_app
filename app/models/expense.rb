# frozen_string_literal: true

# Expense
class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :product
  validates :name, :product, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
