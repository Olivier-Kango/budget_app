# frozen_string_literal: true

class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[edit update destroy]

  def index
    @category = Category.includes(:expenses).find(params[:category_id])
    @expenses = @category.category_recent_expenses
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
    category_id = @expense.category_id

    respond_to do |format|
      format.html do
        if @expense.save
          flash[:sucess] = 'Expense Saved Successfully'
          redirect_to category_expenses_path(category_id:)
        else
          flash.now[:error] = 'Error: The New Expense could not be saved'
          render :new, locals: { expense: @expense }
        end
      end
    end
  end

  def edit
    @categories = Category.where(author: current_user)
  end

  def update
    @expense = Expense.find(params[:id])
    category_id = @expense.category_id

    if @expense.update(expense_params)
      flash[:success] = 'Expense updated successfully.'
      redirect_to category_expenses_path(category_id:)
    else
      flash.now[:error] = 'Error: The expense could not be updated.'
      render :edit
    end
  end

  def destroy
    # Find the expense you want to delete
    @expense = Expense.find(params[:id])

    # Get the category ID of the expense
    category_id = @expense.category_id

    # Delete the expense
    @expense.destroy

    # Redirect to the category_expenses route with the appropriate category_id
    redirect_to category_expenses_path(category_id:), success: 'Expense deleted successfully.'
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_id).merge(author: current_user)
  end
end
