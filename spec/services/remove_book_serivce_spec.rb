# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RemoveBookService, type: :service do
  describe 'call' do
    it 'destroys user_book' do
      user = create(:user)
      book = create(:book)
      user_book = AddBookService.new(user, book, shelf: 'reading').call

      RemoveBookService.new(user, user_book.id).call

      count = UserBook.where(user:, book:).count
      expect(count).to eq(0)
    end

    context 'when user does not have the book added' do
      it 'raises not found error' do
        user = create(:user)

        expect do
          RemoveBookService.new(user, 999).call
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
