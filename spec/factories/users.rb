# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'test user' }
    email { "user#{rand(100_000)}@example.com" }
    password { 'password' }
  end
end
