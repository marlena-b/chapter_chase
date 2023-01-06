# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.paginate(page: params[:page], per_page: 15)
  end
end
