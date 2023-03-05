# frozen_string_literal: true

class AddBookService
  def initialize(user, book, shelf:)
    @user = user
    @book = book
    @shelf = shelf
  end

  def call
    user_book = UserBook.find_or_initialize_by(user: @user, book: @book)
    user_book.update(shelf: @shelf)
    user_book
  end
end
