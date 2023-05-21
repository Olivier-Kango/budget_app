# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'incomes/index', type: :view do
  before(:each) do
    assign(:incomes, [
             Income.create!(
               income: '9.99'
             ),
             Income.create!(
               income: '9.99'
             )
           ])
  end

  it 'renders a list of incomes' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('9.99'.to_s), count: 2
  end
end
