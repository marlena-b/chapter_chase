# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'Alice' }
    author { 'Lewis Carroll' }
    genre { 'fantasy' }
  end
end
