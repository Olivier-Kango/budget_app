# frozen_string_literal: true

require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = categories(:one)
  end

  test 'should get index' do
    get categories_url
    assert_response :success
  end

  test 'should get new' do
    get new_product_url
    assert_response :success
  end

  test 'should create product' do
    assert_difference('Product.count') do
      post categories_url, params: { product: { icon: @product.icon, name: @product.name } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test 'should show product' do
    get product_url(@product)
    assert_response :success
  end

  test 'should get edit' do
    get edit_product_url(@product)
    assert_response :success
  end

  test 'should update product' do
    patch product_url(@product), params: { product: { icon: @product.icon, name: @product.name } }
    assert_redirected_to product_url(@product)
  end

  test 'should destroy product' do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to categories_url
  end
end
