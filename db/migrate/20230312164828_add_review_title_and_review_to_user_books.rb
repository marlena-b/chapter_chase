# frozen_string_literal: true

class AddReviewTitleAndReviewToUserBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :user_books, :review_title, :string
    add_column :user_books, :review, :text
  end
end
