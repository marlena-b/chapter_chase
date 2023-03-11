# frozen_string_literal: true

class AddRatingToUserBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :user_books, :rating, :integer
  end
end
