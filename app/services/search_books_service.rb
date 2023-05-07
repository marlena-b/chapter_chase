# frozen_string_literal: true

class SearchBooksService
  def initialize(params)
    @search_term = params[:search_term]
    @search_by = params[:search_by]
  end

  # rubocop:disable Metrics/MethodLength
  def call
    case @search_by
    when 'title'
      Book.where('title ILIKE :term', term: "%#{@search_term}%")
    when 'author'
      Book.where('author ILIKE :term', term: "%#{@search_term}%")
    when 'isbn'
      Book.where('isbn ILIKE :term', term: "%#{@search_term}%")
    else
      Book.where("title ILIKE :term
        OR author ILIKE :term
        OR isbn ILIKE :term
        OR isbn13 ILIKE :term", term: "%#{@search_term}%")
    end.order(:id).with_attached_image
  end
  # rubocop:enable Metrics/MethodLength
end
