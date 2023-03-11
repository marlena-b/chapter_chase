# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RateBookService, type: :service do
  describe 'call' do
    let(:user_book) { create(:user_book) }

    it 'updates user_book rating' do
      RateBookService.new(user_book, 4).call

      expect(user_book.rating).to eq(4)
    end
  end
end
