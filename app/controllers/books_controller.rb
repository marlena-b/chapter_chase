# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
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

  def book_params
    params.require(:book).permit(:title, :author, :publication_date, :publisher, :isbn, :isbn13, :description, :genre,
                                 :image)
  end
end
