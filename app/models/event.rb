# frozen_string_literal: true

class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_rich_text :description
  has_one_attached :image

  validates :name, :description, :starts_at, :ends_at, :location, presence: true
  validates :starts_at, comparison: { less_than: :ends_at }, allow_blank: true

  scope :upcoming, -> { where('starts_at >= ?', Time.zone.today).order(:starts_at) }
  scope :past,     -> { where('starts_at < ?', Time.zone.today).order(starts_at: :desc) }

  # Returns true if the event has not ended yet.
  def upcoming?
    starts_at >= Time.zone.now
  end
end