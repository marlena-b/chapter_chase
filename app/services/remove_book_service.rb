# frozen_string_literal: true

class RemoveBookService
  def initialize(user, user_book_id)
    @user = user
    @user_book_id = user_book_id
  end

  def call
    user_book = UserBook.find_by!(user: @user, id: @user_book_id)
    user_book.destroy
    user_book.book
  end
end
