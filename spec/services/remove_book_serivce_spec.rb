# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RemoveBookService, type: :service do
  describe 'call' do
    it 'destroys user_book' do
      user = User.create!(email: 'amasm@op.pl', password: 'password')
      book = Book.create!(title: 'Aaaa', author: 'Bbbb', genre: 'criminal')
      user_book = AddBookService.new(user, book).call

      RemoveBookService.new(user, user_book.id).call

      count = UserBook.where(user:, book:).count
      expect(count).to eq(0)
    end

    context 'when user does not have the book added' do
      it 'raises not found error' do
        user = User.create!(email: 'amasm@op.pl', password: 'password')

        expect do
          RemoveBookService.new(user, 999).call
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
