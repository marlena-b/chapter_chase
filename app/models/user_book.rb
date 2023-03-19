# frozen_string_literal: true

class UserBook < ApplicationRecord
  before_save :nullify_blank_review

  belongs_to :user
  belongs_to :book
  validates :shelf, presence: true, inclusion: { in: %w[read want_to_read reading] }
  validates :rating, numericality: { in: 0..5 }, allow_nil: true

  scope :with_review, -> { where.not(review: nil).or(where.not(review_title: nil)) }

  def rating
    self[:rating] || 0
  end

  def review?
    review.present? || review_title.present?
  end

  private

  def nullify_blank_review
    self.review = nil if review.blank?
    self.review_title = nil if review_title.blank?
  end
end
