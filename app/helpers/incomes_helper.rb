# frozen_string_literal: true

module IncomesHelper
  def calculate_total_income(incomes)
    incomes.sum(:income)
  end
end
