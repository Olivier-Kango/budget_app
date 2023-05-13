# frozen_string_literal: true

class ExpensesController < ApplicationController
  def index
    @product = Product.includes(:expenses).find(params[:product_id])
    @expenses = @product.product_recent_expenses
  end

  def new
    @products = Product.where(author: current_user)
    @expense = Expense.new
    respond_to do |format|
      format.html { render :new, locals: { expense: @expense } }
    end
  end

  def create
    @expense = Expense.new(expense_params)

    respond_to do |format|
      format.html do
        if @expense.save
          flash[:sucess] = 'Expense Saved Successfully'
          redirect_to products_path
        else
          flash.now[:error] = 'Error: The New Expense could not be saved'
          render :new, locals: { expense: @expense }
        end
      end
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :product_id).merge(author: current_user)
  end
end
