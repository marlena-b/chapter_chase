# frozen_string_literal: true

class AddAverageRatingToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :average_rating, :decimal
  end
end
