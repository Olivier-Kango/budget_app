# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.where(author: current_user)
  end

  def show
    redirect_to categories_path
  end

  def new
    @category = Category.new
    respond_to do |format|
      format.html { render :new, locals: { category: @category } }
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.create(category_params)

    if @category.save
      flash[:success] = 'Category saved successfully.'
      redirect_to categories_path
    else
      flash.now[:error] = 'Error: The new category could not be saved.'
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = 'Category updated successfully.'
      redirect_to categories_path
    else
      flash.now[:error] = 'Error: The category could not be updated.'
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])

    respond_to do |format|
      if category.destroy
        format.html { redirect_to categories_path, notice: 'Category was deleted successfully.' }
      else
        format.html { render :new, alert: 'An error has occurred while deleting category, try again' }
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon).merge(author: current_user)
  end
end
