# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.page(params[:page])
  end
end
