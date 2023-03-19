# frozen_string_literal: true

class UserBooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = Book.find(params[:book_id])
    @user_book = current_user.user_books.find_or_initialize_by(book: @book)
  end

  def create
    book = Book.find(params[:user_book][:book_id])
    UpsertUserBookService.new(current_user, book, user_book_params).call
    redirect_to book
  end

  def update
    book = Book.find(params[:user_book][:book_id])
    UpsertUserBookService.new(current_user, book, user_book_params).call
    redirect_to book
  end

  def destroy
    book = RemoveBookService.new(current_user, params[:id]).call
    redirect_to book
  end

  def rate
    user_book = current_user.user_books.find(params[:id])
    RateBookService.new(user_book, params[:rating]).call
    redirect_to user_book.book
  end

  private

  def user_book_params
    params.require(:user_book).permit(:shelf, :rating, :review_title, :review)
  end
end
