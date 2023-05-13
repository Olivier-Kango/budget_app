# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.where(author: current_user)
  end

  def show
    @product = Product.find(params[:product_id])
  end

  def new
    @product = Product.new
    respond_to do |format|
      format.html { render :new, locals: { product: @product } }
    end
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      format.html do
        if @product.save
          flash[:sucess] = 'Product Saved Successfully'
          redirect_to products_path
        else
          flash.now[:error] = 'Error: The New Product could not be saved'
          render :new, locals: { product: @product }
        end
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :icon).merge(author: current_user)
  end
end
