# frozen_string_literal: true

class SearchBooksService
  def initialize(search_term)
    @search_term = search_term
  end

  def call
    Book.where("title ILIKE :term
      OR author ILIKE :term
      OR isbn ILIKE :term
      OR isbn13 ILIKE :term",
               term: "%#{@search_term}%").order(:id).with_attached_image
  end
end
