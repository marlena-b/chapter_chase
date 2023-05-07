# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchBooksService, type: :service do
  describe 'call' do
    let!(:book1) do
      create(:book, title: 'Harry Potter', author: 'J.K. Rowling', isbn: '978-83-800-8211-3', isbn13: '978-1408855652')
    end
    let!(:book2) do
      create(:book, title: 'The Hunger Games', author: 'Suzanne Collins', isbn: '978-83-7278-637-1',
                    isbn13: '978-8372789006')
    end
    let!(:book3) do
      create(:book, title: 'The Lord of the Rings', author: 'J.R.R. Tolkien', isbn: '978-83-287-0078-9',
                    isbn13: '978-8377583036')
    end

    it 'finds a book when match on title' do
      books = SearchBooksService.new('Hunger').call

      expect(books).to contain_exactly(book2)
    end

    it 'finds a book when match on author' do
      books = SearchBooksService.new('Collins').call

      expect(books).to contain_exactly(book2)
    end

    it 'finds a book when match on isbn' do
      books = SearchBooksService.new('83-7278').call

      expect(books).to contain_exactly(book2)
    end

    it 'finds a book when match on isbn13' do
      books = SearchBooksService.new('8372789').call

      expect(books).to contain_exactly(book2)
    end
  end
end
