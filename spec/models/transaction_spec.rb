# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expense, type: :model do
  # Test validation
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:product) }

  # Test associations
  it { should belong_to(:author) }
  it { should belong_to(:product) }
end
