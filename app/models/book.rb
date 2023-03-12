# frozen_string_literal: true

class Book < ApplicationRecord
  has_one_attached :image
  has_many :user_books, dependent: :destroy

  validates :title, length: { minimum: 3, maximum: 64 }, presence: true
  validates :author, length: { minimum: 3, maximum: 64 }, presence: true
  validates :genre, length: { minimum: 3, maximum: 64 }
  validates :isbn,   isbn_format: true, allow_blank: true
  validates :isbn13, isbn_format: { with: :isbn13 }, allow_blank: true

  def average_rating
    user_books.average(:rating)
  end
end
