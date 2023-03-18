# frozen_string_literal: true

class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :shelf, presence: true, inclusion: { in: %w[read want_to_read reading] }
  validates :rating, numericality: { in: 0..5 }, allow_nil: true

  def rating
    self[:rating] || 0
  end

  def review?
    review.present? || review_title.present?
  end
end
