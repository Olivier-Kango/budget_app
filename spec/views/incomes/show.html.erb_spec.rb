require 'rails_helper'

RSpec.describe "incomes/show", type: :view do
  before(:each) do
    assign(:income, Income.create!(
      income: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
  end
end
