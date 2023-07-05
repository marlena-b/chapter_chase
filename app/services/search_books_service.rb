# frozen_string_literal: true

class SearchBooksService
  def initialize(params)
    @search_term = params[:search_term]
    @search_by = params[:search_by]
    @genre = params[:genre]
  end

  # rubocop:disable Metrics/MethodLength
  def call
    query = Book.all
    query = apply_search(query)
    query = by_genre(query)

    query.order(:id).with_attached_image
  end
  # rubocop:enable Metrics/MethodLength

  private

  def apply_search(query)
    return query unless @search_by && @search_term

    case @search_by
    when 'title'
      query.where('title ILIKE :term', term: "%#{@search_term}%")
    when 'author'
      query.where('author ILIKE :term', term: "%#{@search_term}%")
    when 'isbn'
      query.where('isbn ILIKE :term', term: "%#{@search_term}%")
    else
      query.where("title ILIKE :term
        OR author ILIKE :term
        OR isbn ILIKE :term
        OR isbn13 ILIKE :term", term: "%#{@search_term}%")
    end
  end

  def by_genre(query)
    return query unless @genre

    query.where(genre: @genre)
  end
end
