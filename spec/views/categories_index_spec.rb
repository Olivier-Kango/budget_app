# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Product Index Page', type: :feature do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Luca', email: 'luca@gmail.com', password: '123456', password_confirmation: '123456')
    @product = Product.create(name: 'Traveling', icon: 'shopping-bag.png', author_id: @user.id)
    sign_in @user
  end

  describe 'GET /index' do
    before :each do
      visit categories_path
    end

    it 'returns the correct product on the page' do
      expect(page).to have_content('Traveling')
    end

    it 'leads to correct page when link is clicked' do
      click_link 'Traveling'
      expect(current_path).to eq("#{product_path(@product)}/expenses")
    end

    it 'has the add new product link' do
      expect(page).to have_link('ADD NEW PRODUCT')
    end

    it 'leads to a page to add a new product' do
      click_link 'ADD NEW PRODUCT'
      expect(current_path).to eq(new_product_path)
    end
  end
end
