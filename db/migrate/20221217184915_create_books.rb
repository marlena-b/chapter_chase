# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.date :publication_date
      t.string :publisher
      t.string :isbn
      t.string :isbn13

      t.timestamps
    end
  end
end
