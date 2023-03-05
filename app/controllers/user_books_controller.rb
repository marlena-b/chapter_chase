# frozen_string_literal: true

class UserBooksController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    AddBookService.new(current_user, book, shelf: params[:shelf]).call
    redirect_to book
  end

  def destroy
    book = RemoveBookService.new(current_user, params[:id]).call
    redirect_to book
  end
end
