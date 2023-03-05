# frozen_string_literal: true

class AddBookService
  def initialize(user, book)
    @user = user
    @book = book
  end

  def call
    UserBook.find_or_create_by(user: @user, book: @book)
  end
end
