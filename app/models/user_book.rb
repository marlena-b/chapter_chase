# frozen_string_literal: true

class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :shelf, presence: true, inclusion: { in: %w[read want_to_read reading] }
end
