# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, length: { minimum: 3, maximum: 64 }, presence: true
  validates :author, length: { minimum: 3, maximum: 64 }, presence: true
  validates :genre, length: { minimum: 3, maximum: 64 }
  validates :isbn,   isbn_format: true
  validates :isbn13, isbn_format: { with: :isbn13 }
end
