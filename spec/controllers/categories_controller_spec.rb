# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Anthony', email: 'anthony@gmail.com', password: '123456',
                        password_confirmation: '123456')
    @category = Category.create(name: 'Grocery', icon: 'shopping-bag.png', author_id: @user.id)
  end

  describe 'GET /index' do
    before :each do
      sign_in @user
      get categories_path
    end

    it 'returns a successful status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index page' do
      expect(response).to render_template('index')
    end

    it 'render exact text on page' do
      expect(response.body).to include('Grocery')
    end
  end
end
