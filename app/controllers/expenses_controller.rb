# frozen_string_literal: true

class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :update, :destroy]

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

  def edit
    @categories = Category.where(author: current_user)
  end

  
  def update
    if @expense.update(expense_params)
      flash[:success] = 'Expense updated successfully.'
      redirect_to categories_path
    else
      flash.now[:error] = 'Error: The expense could not be updated.'
      render :edit
    end
  end

  def destroy
    @expense.destroy
    flash[:success] = 'Expense deleted successfully.'
    redirect_to categories_path
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_id).merge(author: current_user)
  end
end
