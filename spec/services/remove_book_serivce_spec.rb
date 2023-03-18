# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RemoveBookService, type: :service do
  describe 'call' do
    let(:user) { create(:user) }
    let(:book) { create(:book) }

    it 'destroys user_book' do
      user_book = UpsertUserBookService.new(user, book, shelf: 'reading').call

      RemoveBookService.new(user, user_book.id).call

      count = UserBook.where(user:, book:).count
      expect(count).to eq(0)
    end

    it 'recalculates book average_rating' do
      user_book = UpsertUserBookService.new(user, book, shelf: 'reading').call
      RateBookService.new(user_book, 4).call

      RemoveBookService.new(user, user_book.id).call

      expect(user_book.book.reload.average_rating).to eq(nil)
    end

    context 'when user does not have the book added' do
      it 'raises not found error' do
        expect do
          RemoveBookService.new(user, 999).call
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
