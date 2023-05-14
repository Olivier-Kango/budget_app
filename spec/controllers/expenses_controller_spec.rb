# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expense, type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Antonio', email: 'antonio@gmail.com', password: '123456',
                        password_confirmation: '123456')
    @expense = Expense.create(name: 'Costumes', amount: 40, author_id: @user.id)
    @category = Category.create(name: 'Groceries', icon: 'shopping-bag.png', author_id: @user.id)
    sign_in @user
  end

  describe 'GET /index' do
    before :each do
      get categories_path
    end

    it 'returns a successful status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index page' do
      expect(response).to render_template('index')
    end

    it 'render exact text on page' do
      expect(response.body).to include('Groceries')
    end
  end
end
