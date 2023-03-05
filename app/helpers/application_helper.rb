# frozen_string_literal: true

module ApplicationHelper
  HUMAN_READABLE_SHELVES = {
    'read' => 'Read',
    'want_to_read' => 'Want to read',
    'reading' => 'Reading'
  }.freeze
  def human_readable_shelf(shelf)
    HUMAN_READABLE_SHELVES.fetch(shelf)
  end
end
