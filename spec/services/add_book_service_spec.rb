# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AddBookService, type: :service do
  describe 'call' do
    it 'creates user_book' do
      user = create(:user)
      book = create(:book)

      user_book = AddBookService.new(user, book, shelf: 'reading').call

      expect(user_book.user).to eq(user)
      expect(user_book.book).to eq(book)
      expect(user_book).to be_persisted
      expect(user_book.shelf).to eq('reading')
    end

    it 'does not create user book if self is not correct' do
      user = create(:user)
      book = create(:book)

      user_book = AddBookService.new(user, book, shelf: 'fake').call
      expect(user_book).not_to be_persisted
    end

    context 'when user already added the book' do
      it 'does not create second user_book' do
        user = create(:user)
        book = create(:book)
        AddBookService.new(user, book, shelf: 'read').call

        AddBookService.new(user, book, shelf: 'read').call

        count = UserBook.where(user:, book:).count
        expect(count).to eq(1)
      end

      it 'updates the shelf' do
        user = create(:user)
        book = create(:book)
        AddBookService.new(user, book, shelf: 'read').call

        user_book = AddBookService.new(user, book, shelf: 'reading').call

        count = UserBook.where(user:, book:).count
        expect(count).to eq(1)

        expect(user_book.shelf).to eq('reading')
      end
    end
  end
end
