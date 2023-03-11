# frozen_string_literal: true

class RateBookService
  def initialize(user_book, rating)
    @user_book = user_book
    @rating = rating
  end

  def call
    @user_book.update(rating: @rating)
    @user_book
  end
end
