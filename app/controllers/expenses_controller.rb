# frozen_string_literal: true

class ExpensesController < ApplicationController
  def index
    @category = Category.includes(:expenses).find(params[:category_id])
    @expenses = @category.category_recent_Expenses
  end

  def new
    @categories = Category.where(author: current_user)
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
          redirect_to categories_path
        else
          flash.now[:error] = 'Error: The New Expense could not be saved'
          render :new, locals: { expense: @expense }
        end
      end
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_id).merge(author: current_user)
  end
end
