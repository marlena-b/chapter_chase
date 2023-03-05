# frozen_string_literal: true

class AddShelfToUserBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :user_books, :shelf, :string, null: false
  end
end
