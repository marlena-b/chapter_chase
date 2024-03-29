# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = SearchBooksService.new(params).call.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
    @user_book = UserBook.find_or_initialize_by(user: current_user, book: @book)
    @community_reviews = @book.user_books.where.not(user: current_user).and(UserBook.with_review).includes(:user)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = 'Book created!'
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :publication_date, :publisher, :isbn, :isbn13, :description, :genre,
                                 :image)
  end
end
