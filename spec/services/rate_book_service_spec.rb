# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RateBookService, type: :service do
  describe 'call' do
    let(:user_book) { create(:user_book) }

    it 'updates user_book rating' do
      RateBookService.new(user_book, 4).call

      expect(user_book.rating).to eq(4)
    end

    it 'recalculates book average_rating' do
      create(:user_book, book: user_book.book, rating: 5)
      create(:user_book, book: user_book.book, rating: 4)
      create(:user_book, book: user_book.book, rating: 1)

      RateBookService.new(user_book, 4).call

      expect(user_book.book.average_rating).to eq(3.5)

      RateBookService.new(user_book, 2).call

      expect(user_book.book.average_rating).to eq(3.0)
    end
  end
end
