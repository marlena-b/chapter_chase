# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'John Example' }
    sequence(:email) { |n| "person#{n}@example.com" }
    password { 'password' }
  end
end
