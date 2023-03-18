# frozen_string_literal: true

class UpsertUserBookService
  def initialize(user, book, params)
    @user = user
    @book = book
    @params = params
  end

  def call
    user_book = UserBook.find_or_initialize_by(user: @user, book: @book)
    user_book.update(@params)
    user_book
  end
end
